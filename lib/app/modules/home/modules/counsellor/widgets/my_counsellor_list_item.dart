
import 'dart:math';

import 'package:bridgme/app/modules/chat/widgets/msg/receive_msg_box.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/consultant/doctor.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../shared/components/utility/custom_button.dart';
import '../../../../../shared/constants/constants.dart';


class MyCounsellorListItem extends StatelessWidget {
  final TherapistEntity doctor;

  const MyCounsellorListItem({
    Key? key,
    required this.doctor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Random rnd;
    int min = 1;
    int max = 5;
    rnd = new Random();
    var r = min + rnd.nextInt(max - min);
    return Card(
      color: kColorLight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: <Widget>[
            UserAvatar(image: SessionUtils.getAvatarLink(doctor.email!), size: 60),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${doctor.fullName!} ",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    doctor.category! + '\n',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CustomButton(
              text: 'Details',
              textSize: 14,
              onPressed: () {
                Map<String, String> params = {"therapistId":doctor.email!};
                Get.rootDelegate.toNamed(Routes.COUNSELLORPROFILE,parameters: params);
              },
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
