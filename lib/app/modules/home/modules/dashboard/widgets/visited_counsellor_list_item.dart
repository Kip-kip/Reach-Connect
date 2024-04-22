
import 'package:bridgme/app/modules/home/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/consultant/doctor.dart';
import '../../../../../routes/app_pages.dart';


class VisitedCounsellorListItem extends StatelessWidget {
  final TherapistEntity doctor;
  DashboardController controller = Get.put(DashboardController());

   VisitedCounsellorListItem({
    Key? key,
    required this.doctor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color(0x0c000000),
              offset: Offset(0, 5),
              blurRadius: 5,
              spreadRadius: 0),
          BoxShadow(
              color: Color(0x0c000000),
              offset: Offset(0, -5),
              blurRadius: 5,
              spreadRadius: 0),
        ],
      ),

      child: InkWell(
        onTap: (){
          controller.selectedTherapist.clear();
          controller.selectedTherapist.add(doctor);
          Map<String, String> params = {"therapistId":doctor.email!};
          Get.rootDelegate.toNamed(Routes.COUNSELLORPROFILE,parameters: params);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              backgroundImage:NetworkImage(SessionUtils.getAvatarLink(doctor.email!)),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Dr. "+doctor.fullName!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              doctor.category!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
