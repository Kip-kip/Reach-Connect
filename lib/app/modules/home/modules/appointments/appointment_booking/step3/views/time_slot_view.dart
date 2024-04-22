import 'package:bridgme/app/modules/home/modules/appointments/appointment_booking/step3/controllers/time_slot_logic.dart';
import 'package:bridgme/app/modules/home/modules/appointments/appointment_booking/step4/views/patient_details_view.dart';
import 'package:bridgme/app/modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/bindings/my_appointments_binding.dart';
import 'package:bridgme/app/modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import 'package:bridgme/app/modules/home/modules/counsellor/counsellor_profile/controllers/counsellor_profile_logic.dart';
import 'package:bridgme/models/availability/availability.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../shared/components/utility/day_slot_item.dart';
import '../../../../../../../shared/components/utility/doctor_item1.dart';
import '../../../../../../../shared/components/utility/time_slot_item.dart';
import '../../../../../../../shared/constants/constants.dart';
import '../../../../../widgets/custom_app_bar.dart';
import '../../../../counsellor/counsellor_list/controllers/counsellor_list_logic.dart';

//

class TimeSlotPage extends StatelessWidget {
  final _counsellorProfileController = Get.put(CounsellorProfileLogic(""));
  TimeSlotLogic _timeSlotController = Get.find();
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());

  Widget _slot(String time, timeSlots) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
                time, style: TextStyle(fontSize: 16, color: Colors.black))
        ),

        SizedBox(
          height: 15,
        ),
        StaggeredGridView.countBuilder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          crossAxisCount: 4,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: timeSlots.length,
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            return Obx(() {
              return TimeSlotItem(
                time: timeSlots[index].toString(),
                selected: _timeSlotController.checkIfSlotIsAlreadySelected(
                    timeSlots[index]),
                onTap: () {
                  _timeSlotController.updateSelectedTimeSlots(timeSlots[index],
                      _timeSlotController.selected_availability.value
                          .slotDuration);
                },
              );
            });
          },
        )

      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(appBarText: "Time Slot",)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Obx(() {

            if(_timeSlotController.therapist.value.email!.isEmpty){
              return Container();
            } else{
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DoctorItem1(
                    therapist: _timeSlotController.therapist.value,
                  ),
                  Divider(),

                  _timeSlotController.availabilities.value.length > 0 ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 85,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        // color: Prefs.getBool(Prefs.DARKTHEME, def: false)
                        //     ? Colors.white.withOpacity(0.12)
                        //     : Colors.grey[300],
                        child: Obx(() {
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(
                                  width: 10,
                                ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _timeSlotController.availabilities.value
                                .length,
                            itemBuilder: (context, index) {
                              return Obx(() {
                                return DaySlotItem(
                                  onTap: () {
                                    _timeSlotController
                                        .updateSelectedAvailability(
                                        _timeSlotController.availabilities
                                            .value[index]);
                                    _timeSlotController.updateSelectedIndex(
                                        index.toString());
                                  },
                                  availability: _timeSlotController.availabilities
                                      .value[index],
                                  selected: _timeSlotController.selectedIndex.value == index.toString(),
                                );
                              });
                            },
                          );
                        }),
                      ),
                      Divider(),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Obx(() {
                            return Text(
                              _myAppointmentsController.getFormattedDate(
                                  _timeSlotController.selected_availability.value
                                      .day!),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 25,
                      ),
                      Obx(() {
                        return Container(
                            child: _timeSlotController.selected_availability.value
                                .morningSlots!.length > 0 ? _slot("Morning",
                                _timeSlotController.selected_availability.value
                                    .morningSlots) : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  "Therapist has no morning slots for the selected day"),
                            )
                        );
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      Obx(() {
                        return Container(
                            child: _timeSlotController.selected_availability.value
                                .midDaySlots!.length > 0 ? _slot("Afternoon",
                                _timeSlotController.selected_availability.value
                                    .midDaySlots) : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  "Therapist has no afternoon slots for the selected day"),
                            )
                        );
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      Obx(() {
                        return Container(
                            child: _timeSlotController.selected_availability.value
                                .eveningSlots!.length > 0 ? _slot("Evening",
                                _timeSlotController.selected_availability.value
                                    .eveningSlots) : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  "Therapist has no evening slots for the selected day"),
                            )
                        );
                      }),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ) :
                  Container(
                    height: Get.height * 0.3,
                    child: Center(child: SizedBox(
                        height: 35, child: CircularProgressIndicator())),
                  ),


                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: RawMaterialButton(
                            onPressed: () {
                              _timeSlotController.validateSlotsChoices()? Get.rootDelegate.toNamed(Routes.PATIENT_DETAILS_PAGE,parameters: {"therapistId": _timeSlotController.therapist.value.email!}):(){};


                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            fillColor: kColorGreen,
                            child: Container(
                              height: 48,
                              child: const Center(
                                child: Text(
                                  'Proceed with booking',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }

          }),
        ),
      ),
    );
  }
}
