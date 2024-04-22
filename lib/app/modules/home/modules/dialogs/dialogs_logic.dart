import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/chat/dialog_model.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:get/get.dart';

class DialogsLogic extends GetxController {
  @Collection<DialogModel>('dialogs')
  final dialogRef= DialogModelCollectionReference();
  var dialogList = <DialogModel>[].obs;
  var loadingStatus = 0.obs;

  @override
  void onReady() {
   getDialogs();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getDialogs() {
    dialogList.bindStream(dialogRef
        // .orderByLastMessageTime(descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));
  }

  OwnersData getDialogTitle(List<OwnersData> names) {
    var email = SessionUtils.getMail();
    return names.where((element) => element.user != email!).first;
  }
}
