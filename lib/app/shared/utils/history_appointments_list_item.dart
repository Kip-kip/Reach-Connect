import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../models/appointment/appointment_model.dart';
import '../../modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import '../../routes/app_pages.dart';
import '../components/utility/custom_button.dart';
import '../constants/constants.dart';


class HistoryAppointmentListItem extends StatelessWidget {
  final AppointmentModel appointment;
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());

  HistoryAppointmentListItem({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kColorLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: _buildColumn(
                          context: context,
                          title: 'Date'.tr(),
                          subtitle:  _myAppointmentsController.getFormattedDate(appointment.appointmentDate),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: _buildColumn(
                          context: context,
                          title: 'Time'.tr(),
                          subtitle:  _myAppointmentsController.getFormattedTime(appointment.appointmentDate),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomButton(
                  text: 'View'.tr(),
                  textSize: 14,
                  onPressed: () {
                    Get.rootDelegate.toNamed(Routes.APPOINTMENT_DETAIL);
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: _buildColumn(
                          context: context,
                          title: 'Doctor'.tr(),
                          subtitle: appointment.doctorName,
                        ),
                      ),
                      Expanded(
                        child: _buildColumn(
                          context: context,
                          title: 'Speciality'.tr(),
                          subtitle: _myAppointmentsController.getDoctorSpecialty(appointment.doctorEmail),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Visibility(
                  visible: false,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: CustomButton(
                    text: 'Reschedule'.tr(),
                    textSize: 14,
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildColumn({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
