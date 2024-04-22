import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/utils/session.dart';
import 'home_controller.dart';

class UserProfileController extends GetxController {
  var profileImage = "".obs;
  var userProfileName = "".obs;
  var uploading = false.obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    var prefs = Get.find<SharedPreferences>();
    var email = prefs.getString(StorageConstants.userEmail) ?? "";
    if(email.isNotEmpty){
      getUserProfile(email);
    }
    super.onInit();
  }

  void signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = new GoogleSignIn();
    var prefs = Get.find<SharedPreferences>();
    prefs.clear();
    prefs.setString(StorageConstants.splashScreenLoaded, "loaded");
    await _auth.signOut().then((value) {
      googleSignIn.signOut();
      Get.rootDelegate.offAndToNamed(Routes.LOGIN);

    });
  }



  void selectImage(B) {
    final picker = ImagePicker();
    Future pickImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      File _imageFile = File(pickedFile!.path);
    }
  }

  updateUser(String path) {
    Map<String, String> profile = {"imageUrl": path};
    var prefs = Get.find<SharedPreferences>();
    String? documentId = prefs.getString('userId');
    prefs.setString(StorageConstants.displayPicture, path);
    if (documentId != null) {
      CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('users');
      collectionRef
          .doc(documentId)
          .update(profile)
          .then((value) =>
          print("'full_name' & 'age' merged with existing data!"))
          .catchError((error) => print("Failed to merge data: $error"));
    }
  }

  Future<void> getUserProfile(String email) async {
    var prefs = Get.find<SharedPreferences>();
    userProfileName.value =
        prefs.getString(StorageConstants.username) ?? "Unknown";
    profileImage.value = prefs.getString(StorageConstants.displayPicture) ??
        "https://cdn-icons.flaticon.com/png/512/3177/premium/3177440.png?token=exp=1635617682~hmac=a9d2c0a6d3c044d3400b8aca28894f60";
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot =
    await _collectionRef.where('Email', isEqualTo: email).get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    if (allData.isEmpty) {
      print("Could not find profile");
    } else {
      allData.forEach((element) {
        Map data = element as Map;
        if (data.containsKey('imageUrl')) {
          String profilePic = data['imageUrl'];
          prefs.setString(StorageConstants.displayPicture, profilePic);
        }
      });
    }
  }

  FirebaseStorage _storage = FirebaseStorage.instance;

  void uploadPic() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    File? file = await ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        compressQuality: 60,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Cc.kPrimaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));

    if (file != null) {
      uploading.value = true;
      var reference =
      _storage.ref().child("bridgeme_dp/" + SessionUtils.getMail()!);
      var uploadTask = reference.putFile(file);
      uploadTask.then((snap) => {
        snap.ref.getDownloadURL().then((value) {
          profileImage.value = value;
          print(value);

          Get.snackbar("Success", "Image successfully uploaded",
              backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
          updateUser(profileImage.value);
          uploading.value = false;
        })
      });
    }
  }
}