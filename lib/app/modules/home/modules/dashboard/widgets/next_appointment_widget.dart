import 'package:bridgme/app/modules/chat/widgets/msg/receive_msg_box.dart';
import 'package:bridgme/app/shared/utils/imported_utils.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../models/appointment/appointment_model.dart';
import '../../../../../shared/components/utility/round_icon_button.dart';
import '../../../../../shared/constants/constants.dart';
import '../../appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';

class NextAppointmentWidget extends StatelessWidget {
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());
  final AppointmentModel appointment;
  final TherapistEntity therapist;

  NextAppointmentWidget(
      {Key? key, required this.appointment, required this.therapist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
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
                        '${getTimeRemaining(DateTime.fromMillisecondsSinceEpoch(appointment.appointmentDate))}'
                            .tr(),
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
                        _myAppointmentsController
                                .getFormattedDate(appointment.appointmentDate) +
                            " " +
                            _myAppointmentsController
                                .getFormattedTime(appointment.appointmentDate),
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
                  icon: EvaIcons.bookOpenOutline,
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              height: 40,
              thickness: 0.5,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: UserAvatar(image:SessionUtils.getAvatarLink(appointment.doctorEmail), size: 45,),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dr. "+appointment.doctorName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      therapist.specialty ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
