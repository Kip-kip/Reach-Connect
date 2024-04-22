import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/utils/session.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final email = null.obs;
  final dummyResponseState = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString progressStatus = "".obs;
  final GoogleSignIn? _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
  }

  void signIn() {
    AuthService.to.login();
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.HOME);
  }

  void loginWithFacebook() async {
    showLoading(true);
    final result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken!;
      print(accessToken.userId);
      final credential =
      FacebookAuthProvider.credential(result.accessToken!.token);
      var loginResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("login User");
      print(loginResult.user);
      getUserProfile(loginResult.user!.providerData[0].email!, loginResult.user!.providerData[0].displayName!);
    } else {
      print("Facebook failed");
    }
  }
  Future<User?> signInWithGoogle() async {
    progressStatus.value = "Authenticating ...";
    final account = await _googleSignIn?.signIn();
    final authentication =
    await account!.authentication;

    final credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final authResult =
    await _auth.signInWithCredential(credential);
    final user = authResult.user;

    return user;
  }

  Future<void> loginWithGoogle() async {
    try {

      showLoading(true);
      var result = await signInWithGoogle();
      if (result?.email != null) {
        getUserProfile(result!.email!, result.displayName!);
      }
    // ignore: avoid_catches_without_on_clauses
    } catch (error) {
      showLoading(false);
      print("Failed login log:");
      print(error);
      SessionUtils.toast("Error ", "Could not complete google login");
    }
  }

  void showLoading(bool loading) {
    isLoading.value = loading;
  }

  void loginWithEmail(String email, String password) async {
    showLoading(true);
    progressStatus.value = "Checking ...";
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');
    var querySnapshot =
        await _collectionRef.where('email', isEqualTo: email).get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    if (allData.isEmpty) {
      Get.snackbar("Account not found  ",
          "Account associated with email is not found, Please register to login",
          snackPosition: SnackPosition.BOTTOM);
      showLoading(false);
      return;
    }
    progressStatus.value = "Authenticating ...";
    await _auth
        .signInWithEmailAndPassword(
            email: email.trimRight().trimLeft(), password: password)
        .then((value) {
      getUserProfile(email, "");
    }).catchError((onError) {
      showLoading(false);
      Get.snackbar("Error while sign in ", onError.message as String,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<int> saveUser(String firstname, String email) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("users");
    var token = SessionUtils.getToken() ?? "";
    var userdata = <String, dynamic>{
      "username": firstname.removeAllWhitespace,
      "email": email,
      "fullname": firstname,
      "token": [token],
      "imageUrl":
          "https://cdn-icons.flaticon.com/png/512/3177/premium/3177440.png?token=exp=1635617682~hmac=a9d2c0a6d3c044d3400b8aca28894f60"
    };
     reference.add(userdata);
    return 1;
  }
  Future<void> getUserProfile(String email, String username) async {
    progressStatus.value = "Looking up profile...";
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');
    var querySnapshot =
        await _collectionRef.where('email', isEqualTo: email).get();
    final allData = querySnapshot.docs
        .map((doc) => {'data': doc.data(), 'id': doc.id})
        .toList();

    if (allData.isEmpty) {
      await saveUser(username, email)
          .then((value) => getUserProfile(email, username));
    } else {
      for (var element in allData) {
        Map data = element;
        storeProfile(data);
      }
    }
  }

  Future<int> updateUser() async {
    progressStatus.value = "Syncing...";
    var token = await FirebaseMessaging.instance.getToken() ?? "Not found";
    SessionUtils.storeToken(token);
    var profile = <String, String>{"token": token};
    var prefs = Get.find<SharedPreferences>();
    var documentId = prefs.getString('userId');
    if (documentId != null) {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('users');
      collectionRef
          .doc(documentId)
          .update(profile)
          .then((value) => print("'full_name' & 'age' merged with existing data!"))
          .catchError((error) => print("Failed to merge data: $error"));
    }
    return 1;
  }

  void storeProfile(Map dataGroup) async{
    progressStatus.value = "Creating session...";
    var data = dataGroup['data'] as Map<dynamic, dynamic>;
    var id = dataGroup['id'] as String;
    var username = data['fullname'] as String;
    var email = data['email'] as String;

    var prefs = Get.find<SharedPreferences>();
    prefs.setString(StorageConstants.username, username);
    prefs.setString(StorageConstants.userEmail, email);
    prefs.setString('userId', id);

    await updateUser();
    showLoading(false);

    navigateHome();
  }


  void navigateHome() {
    showLoading(false);
    Get.rootDelegate.offNamed(Routes.HOME);
  }
}
