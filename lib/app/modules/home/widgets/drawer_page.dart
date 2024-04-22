import 'package:bridgme/app/modules/chat/widgets/msg/receive_msg_box.dart';
import 'package:bridgme/app/modules/home/controllers/home_controller.dart';
import 'package:bridgme/app/modules/home/controllers/profile_controller.dart';
import 'package:bridgme/app/shared/shared.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../routes/app_pages.dart';
import '../../../shared/constants/constants.dart';


class DrawerPage extends StatelessWidget {
  final void Function() onTap;
  HomeController controller = Get.put(HomeController());
  UserProfileController _profileController = Get.put(UserProfileController());

  DrawerPage({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        backgroundColor: kColorPrimary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white,width: 2)

                          ),
                          child: UserAvatar(image: SessionUtils.getAvatarLink(SessionUtils.getMail()??""), size: 80)),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Obx(() {
                            return Text(
                              controller.fullName.value,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }),
                          CommonWidget.rowHeight(height: 2),
                          Obx(() {
                            return Text(
                              controller.userEmail.value,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }),
                          Divider(color: Colors.white,),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                _logout(
                    image:  Icon(EvaIcons.peopleOutline,size: 30, color: Colors.white,),
                    text: 'My Therapists',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.COUNSELLORLIST);
                    }
                ),
                _logout(
                    image:  Icon(EvaIcons.calendarOutline,size: 30, color: Colors.white,),
                    text: 'Appointments',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.MY_APPOINTMENTS);
                    }
                ),
                _logout(
                    image:  Icon(EvaIcons.layersOutline,size: 30, color: Colors.white,),
                    text: 'Articles',
                    onTap: () {
                      Get.rootDelegate.toNamed(Routes.ARTICLES);
                    }
                ),

                _logout(
                    image:  Icon(EvaIcons.logOutOutline,size: 30, color: Colors.white,),
                    text: 'Sign Out',
                    onTap: () {
                      _profileController.signOut();
                    }
                ),


                // _drawerItem(
                //   image: 'hospital',
                //   text: 'hospitals',
                //   onTap: () {},
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell _drawerItem({
    required String image,
    required String text,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
        //this.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 58,
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/$image.png',
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }


  InkWell _logout({
    required Icon image,
    required String text,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
        //this.onTap();
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        width: double.infinity,

        child: Row(
          children: <Widget>[
          image,
            SizedBox(
              width: 10,
            ),
            Text(
              text.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
