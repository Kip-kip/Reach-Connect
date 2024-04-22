import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../../../shared/constants/constants.dart';
import '../../../../../../widgets/custom_app_bar.dart';
import '../../history_appointments/history_appointments_page.dart';
import '../../upcoming_appointments/upcoming_appointments_page.dart';


class MyAppointmentsPage extends StatefulWidget {
  @override
  _MyAppointmentsPageState createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> {
  static const _kTabTextStyle = TextStyle(
    color: kColorPrimaryDark,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static const _kUnselectedTabTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  final _kTabPages = [
    UpcomingAppointmentsPage(),
    HistoryAppointmentsPage(),
  ];

  final _kTabs = [
    Tab(
      text: 'upcoming'.tr(),
    ),
    Tab(
      text: 'history'.tr(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: CustomAppBar(appBarText: "My Appointments",)),
      body: DefaultTabController(
        length: _kTabs.length,
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorColor: kColorPrimary,
              labelStyle: _kTabTextStyle,
              unselectedLabelStyle: _kUnselectedTabTextStyle,
              labelColor: kColorPrimary,
              unselectedLabelColor: Colors.grey,
              tabs: _kTabs,
            ),
            Expanded(
              child: TabBarView(
                children: _kTabPages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
