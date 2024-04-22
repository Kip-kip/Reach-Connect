
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/consultant/doctor.dart';


class VisitedCounsellorListItem extends StatelessWidget {
  final Doctor doctor;

  const VisitedCounsellorListItem({
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
          // Get.toNamed(Routes.COUNSELLORPROFILE);
        },
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(doctor.avatar!),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              doctor.name!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              doctor.speciality!,
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
