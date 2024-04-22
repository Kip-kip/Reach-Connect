import 'package:bridgme/models/user/user_model_entity.dart';
import 'package:get/get.dart';
import '../../../../models/notification/notification_model.dart';

class ChatDialogController extends GetxController {
  late RxList<UserModelEntity> users = RxList.empty();
  var notificationList = <NotificationModel>[].obs;
  var message = "".obs;
  RxString email = "".obs;

  @override
  void onInit() {
    loadUsers();
    super.onInit();
  }

  loadUsers() {
    notificationList
        .add(NotificationModel(title: "mfalme@gmail.com", text: "Samp"));
    notificationList
        .add(NotificationModel(title: "adembamary@gmail.com", text: "Samp"));
  }

  listenerForNotifications() async {
    // Get.snackbar("started", "started");
  }
}
