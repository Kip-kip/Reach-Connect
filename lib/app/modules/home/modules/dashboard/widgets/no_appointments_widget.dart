import 'package:bridgme/app/routes/app_pages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/components/utility/round_icon_button.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/constants/constants.dart';

// class NoAppointmentsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 20,
//           ),
//           Image.asset('assets/images/icon_no_appointments.png'),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             'there_is_no_appontments'.tr(),
//             style: TextStyle(
//               color: kColorDarkGreen,
//               fontSize: 20,
//               fontFamily: 'NunitoSans',
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             'create_new_appointment'.tr(),
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 14,
//               fontFamily: 'NunitoSans',
//               fontWeight: FontWeight.w300,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//             height: 100,
//             child: Icon(
//               Icons.arrow_downward,
//               color: kColorGreen,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class NoAppointmentWidgeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: kColorGreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Take a survey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Help us match you with the best therapist online',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              RoundIconButton(
                onPressed: () {},

                size: 60,
                icon:EvaIcons.awardOutline,
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: 40,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(

                padding: EdgeInsets.all(2),
                // decoration: BoxDecoration(
                //   shape: BoxShape.circle,
                //   color: Colors.white,
                // ),
                child: FlatButton(
                    color: Colors.white,
                    child: Text("Start"),
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.SURVEY_INTRO);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
