import 'package:flutter/material.dart';

import '../../../../../../models/notification/notification_entity.dart';
import '../../../../../../models/notification/notification_model.dart';
import '../../../../../shared/data/pref_manager.dart';

class NotificationListItem extends StatelessWidget {
  final NotificationModel notification;
  final String date;
  final void Function() onTap;

  const NotificationListItem({
    Key? key,
    required this.notification,
    required this.onTap,
    required this.date,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = false;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        child: Row(
          children: <Widget>[
            Image.asset(notification.image!),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    notification.title!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    notification.text! + '\n',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              date,
              style: TextStyle(
                color: isDark
                    ? Colors.white.withOpacity(0.5)
                    : Colors.grey.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
