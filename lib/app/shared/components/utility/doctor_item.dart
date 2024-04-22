import 'dart:math';

import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../models/consultant/doctor.dart';
import '../../constants/constants.dart';


class DoctorItem extends StatelessWidget {
  final TherapistEntity doctor;
  final void Function() onTap;

  const DoctorItem({
    Key? key,
    required this.onTap,
    required this.doctor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Random rnd;
    int min = 1;
    int max = 5;
    rnd = new Random();
    var r = min + rnd.nextInt(max - min);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/icon_doctor_${r}.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          doctor.fullName!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: kColorGreen,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${doctor.review?? 5}',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    doctor.category!,
                    style: TextStyle(
                      color: Colors.grey[350],
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${'Start from'.tr()} KES ${doctor.price ?? 20}/min',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
