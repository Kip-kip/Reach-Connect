import 'package:bridgme/app/shared/utils/date_utils.dart';
import 'package:date_utils/date_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../edit_profile/controllers/edit_profile_logic.dart';
import 'profile_info_tile.dart';

class InfoWidget extends StatelessWidget {
  final _editProfileController = Get.put(EditProfileLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(
            'Name:'.tr(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Obx(() {
            return Text(
              _editProfileController.userModel.value.fullname ?? "",
              style: Theme.of(context).textTheme.subtitle2,
            );
          }),
          trailing: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            //backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        Divider(
          height: 0.5,
          color: Colors.grey[200],
          indent: 15,
          endIndent: 15,
        ),
        Obx(() {
          return ProfileInfoTile(
            title: 'Phone number'.tr(),
            trailing: _editProfileController.userModel.value.phone,
            hint: 'Add phone number',
          );
        }),
        Obx(() {
          return ProfileInfoTile(
            title: 'Email'.tr(),
            trailing: _editProfileController.userModel.value.email,
            hint: 'Add email'.tr(),
          );
        }),
        Obx(() {
          return ProfileInfoTile(
            title: 'Gender'.tr(),
            trailing: _editProfileController.gender.value,
            hint: 'add_gender'.tr(),
          );
        }),
        Obx(() {
          return ProfileInfoTile(
            title: 'Date of birth'.tr(),
            trailing: formatReadableDate(DateTime.fromMillisecondsSinceEpoch(
                _editProfileController.userModel.value.dob??0)),
            hint: 'yyyy mm dd',
          );
        }),
        // ProfileInfoTile(
        //   title: 'Blood group'.tr(),
        //   trailing: _editProfileController.bloodGroup.value,
        //   hint: 'add_blood_group'.tr(),
        // ),
        // ProfileInfoTile(
        //   title: 'Marital status'.tr(),
        //   trailing: _editProfileController.maritalStatus.value,
        //   hint: 'Add marital status'.tr(),
        // ),
        // ProfileInfoTile(
        //   title: 'Height'.tr(),
        //   trailing: _editProfileController.height.value.toString(),
        //   hint: 'Add height'.tr(),
        // ),
        // ProfileInfoTile(
        //   title: 'Weight'.tr(),
        //   trailing: _editProfileController.weight.value.toString(),
        //   hint: 'Add weight'.tr(),
        // ),
        // ProfileInfoTile(
        //   title: 'Emergency contact'.tr(),
        //   trailing: _editProfileController.emergencyContact.value.toString(),
        //   hint: 'Add emergency contact'.tr(),
        // ),
        // ProfileInfoTile(
        //   title: 'Location'.tr(),
        //   trailing: _editProfileController.location.value.toString(),
        //   hint: 'Add location'.tr(),
        // ),
      ],
    );
  }
}
