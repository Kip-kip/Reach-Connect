import 'package:bridgme/app/modules/chat/widgets/msg/receive_msg_box.dart';
import 'package:bridgme/app/modules/home/modules/profile/controllers/profile_controller.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../routes/app_pages.dart';
import '../../../../../shared/components/utility/round_icon_button.dart';
import '../../../../../shared/constants/constants.dart';
import '../../appointments/appointment_info/appointment_profile/history_appointments/history_appointments_page.dart';
import '../../appointments/appointment_info/appointment_profile/upcoming_appointments/upcoming_appointments_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  final _profileController = Get.put(ProfileController());
  final _kTabTextStyle = TextStyle(
    color: kColorGreen,
    fontSize: 14,
    // fontWeight: FontWeight.w400,
    // fontStyle: FontStyle.normal,
    fontFamily: "NunitoSans",
  );

  final _kTabPages = [
    //VisitPage(),
    UpcomingAppointmentsPage(),
    HistoryAppointmentsPage(),
    //ExaminationPage(),
    //TestPage(),
    //PrescriptionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool _isdark = false;

    var _kTabs = [
      Tab(
        text: 'Upcoming'.tr(),
      ),
      Tab(
        text: 'History'.tr(),
      ),
      // Tab(
      //   text: 'visit'.tr(),
      // ),
      // Tab(
      //   text: 'examination'.tr(),
      // ),
      // Tab(
      //   text: 'test'.tr(),
      // ),
      // Tab(
      //   text: 'prescription'.tr(),
      // ),
    ];

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          //color: Colors.white,
          child: Row(
            children: <Widget>[
              Obx(() {
                return UserAvatar(image: SessionUtils.getAvatarLink(
                    _profileController.email.value), size: 62);
              }),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Obx(() {
                      return Text(
                        _profileController.fullName.value,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle2,
                      );
                    }),
                    SizedBox(
                      height: 3,
                    ),
                    Obx(() {
                      return Text(
                        _profileController.email.value,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      );
                    }),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _profileController.phone.value,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              RoundIconButton(
                onPressed: () {
                  Get.rootDelegate.toNamed(Routes.EDIT_PROFILE);
                },
                icon: Icons.person,
                size: 40,
                color: kColorGreen,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: DefaultTabController(
            length: _kTabs.length,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _isdark ? kColorDark : Color(0xfffbfcff),
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: _isdark ? Colors.black87 : Colors.grey[200]!,
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: _isdark ? Colors.black87 : Colors.grey[200]!,
                      ),
                    ),
                  ),
                  child: TabBar(
                    indicatorColor: kColorGreen,
                    labelStyle: _kTabTextStyle.copyWith(color: Colors.grey,fontFamily: "NunitoSans"),
                    unselectedLabelStyle:
                    _kTabTextStyle.copyWith(color: Colors.grey,fontFamily: "NunitoSans"),
                    labelColor: kColorGreen,
                    unselectedLabelColor: Colors.grey,
                    tabs: _kTabs,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: _kTabPages,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
