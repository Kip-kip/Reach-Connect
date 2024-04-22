import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


import '../../../../../models/chat/dialog_model.dart';
import '../../../../shared/utils/session.dart';
import '../../../home/controllers/home_controller.dart';

class DialogsScreenController extends GetxController {
  var dialogList = <DialogModel>[].obs;
  var loadingStatus = 0.obs;
  var selectedIndex = 1000000000.obs;
  var selectedDialog =<DialogModel>[].obs;

  @override
  void onInit() {
    getDialogs();
    super.onInit();
  }

  @override
  void onReady() {
    getDialogs();
    super.onReady();
  }

  void goBack() {
    HomeController controller = Get.find();
    // controller.switchTabx(0);
  }

  OwnersData getDialogTitle(List<OwnersData> names) {
    var email = SessionUtils.getMail();
    return names.where((element) => element.user != email!).first;
  }

  Future<OwnersData> getDialogData(List<OwnersData> names) async {
    var email = SessionUtils.getMail();
    var currentUser = names.where((element) => element.user != email!).first;
    var profile =
        await getUserProfile(currentUser.user) as Map<String, dynamic>;
    if (profile.containsKey('imageUrl')) {
      currentUser.image = profile['imageUrl'];
    }
    currentUser.userName = profile['First Name'];
    return currentUser;
  }

  Future<Object?> getUserProfile(String email) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot =
        await _collectionRef.where('Email', isEqualTo: email).get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData.first;
  }

  Future getDialogs() async {
    loadingStatus.value = 1;
    var email = SessionUtils.getMail();
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('chats');
        _collectionRef
        .where('owners', arrayContains: email)
        .orderBy('last_message_time', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      final allData = querySnapshot.docs.map((doc) => doc).toList();
      dialogList.clear();

      if (allData.isEmpty) {
        loadingStatus.value = 2;
      } else {
        loadingStatus.value = 0;
      }
      allData.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;
        var dialog = DialogModel.fromJson(data);
        if (dialogList.contains(dialog) == false &&
            dialog.ownersData
                .where((element) => element.user == SessionUtils.getMail())
                .isNotEmpty) {
          dialogList.add(dialog);
        }
      });
    });

    return true;
  }
}
