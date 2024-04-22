
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../models/notification/notification_entity.dart';
import '../../../models/notification/notification_model.dart';


class Boxes {
  static Box<NotificationModel> getNotification() =>
      Get.find<Box<NotificationModel>>();
}
