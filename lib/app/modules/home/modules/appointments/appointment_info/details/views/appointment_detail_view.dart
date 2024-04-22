import 'package:bridgme/app/modules/home/modules/appointments/appointment_booking/step4/controllers/patient_details_logic.dart';
import 'package:bridgme/app/modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import 'package:bridgme/app/modules/home/modules/appointments/appointment_info/details/controllers/appointment_detail_logic.dart';
import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../shared/components/utility/custom_button.dart';
import '../../../../../../../shared/components/utility/doctor_item1.dart';
import '../../../../../../../shared/constants/constants.dart';
import '../../../../../widgets/custom_app_bar.dart';
import '../../../../counsellor/counsellor_list/controllers/counsellor_list_logic.dart';


class AppointmentDetailPage extends StatefulWidget {
  @override
  _AppointmentDetailPageState createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  AppointmentDetailLogic logic = Get.find();
  final appointmentsLogic = Get.put(MyAppointmentsLogic());
  final bool _isdark = false;

  //Prefs.isDark()
  Color get _color => _isdark ? kColorDark : Colors.white;

  Widget dateAndTime() {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'Date and time'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              return Text(
                appointmentsLogic.getFormattedDate(
                    logic.appointment.value
                        .appointmentDate) + " " +
                    appointmentsLogic.getFormattedTime(
                        logic.appointment.value
                            .appointmentDate),

                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            // Text(
            //   '${'In'.tr()} 13 ${'hours'.tr()}',
            //   style: TextStyle(
            //     fontSize: 14,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget practiceDetail() {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'Appointment Bill'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              return Text(
                "KES  ${logic.appointment.value.doctorBill}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            // Text(
            //   '3719  Jehovah Drive, Roanoke, Virginia - 24011',
            //   style: TextStyle(
            //     fontSize: 14,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget procedure() {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'Status'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              return Text(
                '${logic.appointment.value.status}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget bookingDetails() {
    return Container(
      width: double.infinity,
      color: _color,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Booked for'.tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Text(
                        "Dr. " + logic.appointment.value.doctorName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Container(
                height: 80,
                child: VerticalDivider(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Appointment ID'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        logic.appointmentId,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(appBarText: "Appointment Details",)),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Obx(() {
            return Column(
              children: <Widget>[
                logic.appointment.value.id == "" ?
                Container(
                  height: Get.height * 0.5,
                  child: Center(child: SizedBox(
                      height: 35, child: CircularProgressIndicator())),
                ) :
                Expanded(
                  child: Container(
                    color: Colors.white,
                    // _isdark ? Colors.transparent : Colors.grey[300]
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            color: _isdark ? Colors.transparent : Colors.white,
                            child: Obx(() {
                              return DoctorItem1(
                                therapist: TherapistEntity(email: logic.appointment.value.doctorEmail, fullName: logic.appointment.value.doctorName, category: "Therapy Session"),
                              );
                            }),
                          ),
                          Divider(
                            color: _isdark ? Colors.black : Colors.grey[300],
                          ),
                          dateAndTime(),
                          Divider(),
                          practiceDetail(),
                          Divider(),
                          procedure(),
                          Divider(),
                          bookingDetails(),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                    '${'Follow the procedure below to make payment'
                                        .tr()} ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontFamily: "NunitoSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Make payment'.tr(),
                                    style: TextStyle(
                                      color: kColorDarkGreen,
                                      fontSize: 16,
                                      fontFamily: "NunitoSans",
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: CustomButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.DASHBOARD);
                    },
                    text: 'Done'.tr(),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
