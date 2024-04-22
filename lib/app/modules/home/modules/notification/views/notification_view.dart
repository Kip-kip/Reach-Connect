import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../widgets/custom_app_bar.dart';
import '../../appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import '../controllers/notification_logic.dart';
import '../widgets/notification_list_item.dart';


class NotificationsPage extends StatelessWidget {
  final _notificationsController = Get.put(NotificationLogic());
  final _myAppointments = Get.put(MyAppointmentsLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(appBarText: "Notifications",)),
      body: ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(
              indent: 0,
              endIndent: 0,
            ),
        itemCount: _notificationsController.notifications.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return NotificationListItem(
              notification: _notificationsController.notifications[index],
              date: _myAppointments.getFormattedDate(_notificationsController.notifications[index].time)+" "+_myAppointments.getFormattedTime(_notificationsController.notifications[index].time),
              onTap: () {},
            );
          });
        },
      ),
    );
  }
}
