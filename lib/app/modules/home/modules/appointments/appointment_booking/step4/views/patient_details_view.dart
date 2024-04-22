import 'package:bridgme/app/modules/home/modules/appointments/appointment_booking/step4/controllers/patient_details_logic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../shared/components/text/custom_text_form_field.dart';
import '../../../../../../../shared/components/utility/custom_button.dart';
import '../../../../../../../shared/components/utility/doctor_item1.dart';
import '../../../../../../../shared/constants/constants.dart';
import '../../../../../widgets/custom_app_bar.dart';
import '../../../../counsellor/counsellor_list/controllers/counsellor_list_logic.dart';
import '../../../../counsellor/counsellor_profile/controllers/counsellor_profile_logic.dart';
import '../../../appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import '../../step3/controllers/time_slot_logic.dart';


// class PatientDetailsPage extends StatefulWidget {
//   @override
//   PatientDetailsPageState createState() => _PatientDetailsPageState();
// }

class PatientDetailsPage extends StatelessWidget {
  PatientDetailsLogic _patientDetailsController = Get.find();
  final _counsellorProfileController = Get.put(CounsellorProfileLogic(""));
  TimeSlotLogic _timeSlotController = Get.find();
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());

  late bool _isdark = false;
  bool _patient = true;
  var _nameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _patientPhoneController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  // void initState() {
  //   super.initState();
  //   _nameController.text = 'Faith chepkosgei';
  //   _phoneController.text = '+254781348677';
  // }

  Widget _patientDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _patient
              ? '${'please_provide_following_information_about'
              .tr()} Faith chepskosgei:'
              : 'please_provide_following_patient_details_dot'.tr(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          _patient ? '${'full_name'.tr()}*' : '${'patient_full_name'.tr()}*',
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _nameController,
          hintText: _patient ? '' : 'Faith Chepkosge',
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${'mobile'.tr()}*',
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _phoneController,
          hintText: '+213781348677',
          enabled: false,
        ),
        _patient ? Container() : _patientsMobile(),
        SizedBox(
          height: 15,
        ),
        Text(
          _patient ? '${'your_email'.tr()}*' : '${'patient_email'.tr()}*',
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _emailController,
          hintText: _patient
              ? 'enter_your_email_id'.tr()
              : 'enter_patient_email_id'.tr(),
        ),
      ],
    );
  }

  Widget _patientsMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text(
          'Patient\'s Mobile*',
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _patientPhoneController,
          hintText: 'Enter Patient\'s Mobile Number',
        ),
      ],
    );
  }

  Color get _color => _isdark ? kColorDark : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar2(appBarText: "Booking Details",)),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                //color: _isdark ? Colors.transparent : Colors.grey[300],
                child: SingleChildScrollView(

                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(),
                      Obx(() {
                        return Container(
                          color: _isdark ? Colors.transparent : Colors.white,
                          child: DoctorItem1(
                            therapist: _timeSlotController.therapist
                                .value,
                          ),
                        );
                      }),
                      Divider(
                        color: _isdark ? Colors.black : Colors.grey[300],
                        height: 0.5,
                      ),
                      Container(
                        width: double.infinity,
                        color: _color,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              SizedBox(
                                height: 15,
                              ),

                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
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
                                'Appointment Time'.tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Obx(() {
                                return Container(
                                  height: Get.height * 0.1,
                                  child: ListView.builder(
                                      itemCount: _timeSlotController
                                          .selected_slots.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return Text(
                                          _myAppointmentsController
                                              .getFormattedDate(
                                              _timeSlotController
                                                  .selected_slots[index]) +
                                              " " + _myAppointmentsController
                                              .getFormattedTime(
                                              _timeSlotController
                                                  .selected_slots[index]),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      }),
                                );
                              }),
                              Obx(() {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Appointment Fee'.tr(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Kes: " +
                                        _timeSlotController.appointmentFee
                                            .value, style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,),
                                    )
                                  ],
                                );
                              }),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        color: _color,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'This appointment for:'.tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Material(
                                color: _isdark
                                    ? Colors.white.withOpacity(0.12)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: _isdark
                                            ? Colors.black
                                            : Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      RadioListTile(
                                        value: true,
                                        onChanged: (value) {

                                        },
                                        groupValue: _patient,
                                        title: Obx(() {
                                          return Text(_timeSlotController.therapist.value.fullName??"");
                                        }),
                                      ),
                                      Divider(
                                        color: _isdark
                                            ? Colors.black
                                            : Colors.grey,
                                        height: 1,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              //_patientDetails(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${'By booking this appointment you agree to the '
                                    .tr()} ',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'T&C'.tr(),
                                style: TextStyle(
                                  color: kColorDarkGreen,
                                  fontSize: 16,
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
                  _patientDetailsController.confirmBookingDetails(
                      _timeSlotController.selected_slots as List<int>,int.parse(_timeSlotController.appointmentFee
                      .value));

                },
                text: 'Confirm'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
