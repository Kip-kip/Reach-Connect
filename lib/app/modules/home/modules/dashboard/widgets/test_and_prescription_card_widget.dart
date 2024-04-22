import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';

class TestAndPrescriptionCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Function? onTap;
  final images = [
    "love.png",
    "brain.png",
    "healthcare-and-medical.png",
    "icon_pill_bottle.png",
    "medicine.png"
  ];

  TestAndPrescriptionCardWidget({
    Key? key,
    this.image = '',
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kColorLight,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                child: Image.asset(
                  'assets/images/${images[Random().nextInt(5)]}',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
