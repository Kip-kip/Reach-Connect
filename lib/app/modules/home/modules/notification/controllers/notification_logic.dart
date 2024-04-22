import 'package:get/get.dart';

import '../../../../../../models/notification/notification_model.dart';

class NotificationLogic extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNotifications();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

  }

  loadNotifications(){
     notifications.value = [NotificationModel(
        title: 'Appointment reminder',
        text: 'Don\'t forget your next appointment with doctor Faith tomorrow',
        image: 'assets/images/reminder.png',
        time: 234892049,
      ),
      NotificationModel(
        title: 'Health tips',
        text: 'Consume less salt and sugar.',
        image: 'assets/images/tip.png',
        time: 234892049,
      ),
      NotificationModel(
        title: 'Appointment confirmation',
        text: 'Doctor Faith Chepkosge confirmed your booking appointment',
        image: 'assets/images/confirmation.png',
        time: 930945,
      ),
      NotificationModel(
        title: 'Medical Check up Reminder',
        text: 'Don\'t forget to do your monthly medical check up',
        image: 'assets/images/reminder.png',
        time: 89204902,
      ),
      NotificationModel(
        title: 'Prescription Reminder',
        text: 'Contact doctor Liana about the last visit prescription',
        image: 'assets/images/reminder.png',
        time: 234892049,
      ),
    ];
  }
}
