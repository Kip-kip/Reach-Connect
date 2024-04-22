import 'dart:io';

import 'package:bridgme/app/shared/utils/date_utils.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../shared/components/text/custom_text_form_field.dart';
import '../../../../../shared/constants/constants.dart';
import '../edit_profile/controllers/edit_profile_logic.dart';

class EditWidget extends StatelessWidget {
  final _editProfileController = Get.put(EditProfileLogic());

  final TextEditingController fullNameController;
  final TextEditingController contactNumberController;
  final TextEditingController emailController;
  final TextEditingController dobController;
  final TextEditingController genderController;

  EditWidget({
    Key? key,
    required this.fullNameController,
    required this.contactNumberController,
    required this.emailController,
    required this.dobController,
    required this.genderController,
  }) : super(key: key);

  static const _bloodItems = <String>[
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];
  List<DropdownMenuItem<String>> dropDownBlood = _bloodItems
      .map((String _bloodvalue) =>
      DropdownMenuItem<String>(
        value: _bloodvalue,
        child: Text(_bloodvalue),
      ))
      .toList();

  static const _genderItems = <String>['Male', 'Female'];
  List<DropdownMenuItem<String>> _dropDownGender = _genderItems
      .map((String _gendervalue) =>
      DropdownMenuItem<String>(
        value: _gendervalue,
        child: Text(_gendervalue),
      ))
      .toList();

  static const _maritalItems = <String>['Single', 'Married'];
  List<DropdownMenuItem<String>> _dropDownMarital = _maritalItems
      .map((String _maritalvalue) =>
      DropdownMenuItem<String>(
        value: _maritalvalue,
        child: Text(_maritalvalue),
      ))
      .toList();

  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future _getImage(ImageSource imageSource) async {
    PickedFile? _imageFile;
    _imageFile = await _picker.getImage(source: imageSource);
    if (_imageFile != null) {
      // setState(() {
      //   _image = File(_imageFile!.path);
      // });
    }
    //uploadPic();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  _openBottomSheet(context);
                },
                child: _image == null
                    ? CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  //backgroundImage: NetworkImage(avatarUrl),
                )
                    : CircleAvatar(
                  radius: 30,
                  backgroundImage: FileImage(_image!),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  _openBottomSheet(context);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(4)),
                child: Text(
                  'Change avatar'.tr(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Full name:'.tr(),
              style: kInputTextStyle,
            ),
            Obx(() {
              return CustomTextFormField(
                hintText: _editProfileController.userModel.value.fullname ?? "",
                initial: _editProfileController.userModel.value.fullname ?? "",
                controller: fullNameController,
                validator: (value) =>
                value!.isEmpty ? 'Please insert a valid first name' : null,
              );
            }),
            SizedBox(height: 15),
            // Text(
            //   'Last name'.tr(),
            //   style: kInputTextStyle,
            // ),
            // CustomTextFormField(
            //   hintText: 'Doe',
            //   validator: (value) =>
            //       value!.isEmpty ? 'Please insert a valid last name' : null,
            // ),
            SizedBox(height: 15),
            Text(
              'Phone number:'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              controller: contactNumberController,
              keyboardType: TextInputType.phone,
              initial: _editProfileController.userModel.value.phone ?? "",
              hintText: '0781 34 86 77',
            ),
            SizedBox(height: 15),
            Text(
              'Email:'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              controller: emailController,
              initial: _editProfileController.userModel.value.email ?? "",
              hintText: 'bhr.tawfik@gmail.com',
              enabled: true,
            ),
            SizedBox(height: 15),
            Text(
              'Gender:'.tr(),
              style: kInputTextStyle,
            ),
            Obx(() {
              return DropdownButton(
                isExpanded: true,
                value: _editProfileController.gender.value,
                //hint: ,
                onChanged: (String? value) {
                  _editProfileController.updateGender(value);
                },
                items: _dropDownGender,
              );
            }),
            SizedBox(height: 15),
            Text(
              'Date of Birth:'.tr(),
              style: kInputTextStyle,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Obx(() {
                return Text(formatReadableDate(
                    DateTime.fromMillisecondsSinceEpoch(
                        _editProfileController.dob.value)));
              }),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((DateTime? value) {
                  if (value != null) {
                    _editProfileController.updateBirthDate(value);
                  } else {
                    SessionUtils.info("Error", "Date is empty");
                  }
                });
              },
            ),
            // SizedBox(height: 15),
            // Text(
            //   'Blood group:'.tr(),
            //   style: kInputTextStyle,
            // ),
            // Obx(() {
            //   return DropdownButton(
            //     isExpanded: true,
            //     value: _editProfileController.selectedBloodGroup.value,
            //     //hint: ,
            //     onChanged: (String? value) {
            //       _editProfileController.updateBloodGroup(value.toString());
            //     },
            //     items: dropDownBlood,
            //   );
            // }),
            // SizedBox(height: 15),
            // Text(
            //   'Marital status:'.tr(),
            //   style: kInputTextStyle,
            // ),
            // Obx(() {
            //   return DropdownButton(
            //     isExpanded: true,
            //     value: _editProfileController.selectedMarital.value,
            //     //hint: ,
            //     onChanged: (String? value) {
            //       _editProfileController.updateMarital(value.toString());
            //     },
            //     items: _dropDownMarital,
            //   );
            // }),
            // SizedBox(height: 15),
            // Text(
            //   'Height:'.tr(),
            //   style: kInputTextStyle,
            // ),
            // CustomTextFormField(
            //   controller: heightController,
            //   keyboardType: TextInputType.number,
            //   hintText: 'in cm'.tr(),
            // ),
            // SizedBox(height: 15),
            // Text(
            //   'Weight:'.tr(),
            //   style: kInputTextStyle,
            // ),
            // CustomTextFormField(
            //   controller: weightController,
            //   keyboardType: TextInputType.number,
            //   hintText: 'in kg'.tr(),
            // ),
          ],
        ),
      ),
    );
  }

  _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.camera,
                  size: 20,
                ),
                title: Text(
                  'Take a photo'.tr(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  size: 20,
                ),
                title: Text(
                  'Choose a photo'.tr(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.gallery);
                },
              ),
            ],
          );
        });
  }
}
