import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../shared/components/utility/custom_button.dart';
import '../../../../../../shared/constants/constants.dart';
import '../../../../../../shared/utils/utils.dart';
import '../../widgets/edit_widget.dart';
import '../../widgets/info_widget.dart';
import '../controllers/edit_profile_logic.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _editing = false;
  final fullNameController = TextEditingController();
  final contactNumberController =  TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();


  final _editProfileController = Get.put(EditProfileLogic());

  final confirmPasswordController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
            onTap: (){
              goBack();
            },
            child: Icon(Icons.arrow_back_ios,color: kColorPrimary)),
        title: Text('Edit Profile'.tr(),style: TextStyle(color: kColorPrimary)),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _editing = !_editing;
              });
            },
            icon: Icon(
              _editing ? Icons.close : Icons.edit,
              color: kColorGreen,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: _editing ? EditWidget(
                fullNameController: fullNameController,
                genderController: genderController,
                dobController:dobController,
                emailController: emailController,
                contactNumberController: contactNumberController,
              ) : InfoWidget(),
            ),
          ),
          if (_editing)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                onPressed: () {
                  _editProfileController.updateProfile(
                      fullNameController.text,
                      contactNumberController.text,
                      emailController.text);
                },
                text: 'Update Info'.tr(),
              ),
            )
        ],
      ),
    );
  }
}
