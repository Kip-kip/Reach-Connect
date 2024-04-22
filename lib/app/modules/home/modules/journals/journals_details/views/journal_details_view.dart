import 'package:bridgme/app/modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import 'package:bridgme/app/modules/home/modules/journals/journals_details/controllers/journals_details_logic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/constants.dart';
import '../../../../../../shared/utils/utils.dart';


class JournalDetailsPage extends StatelessWidget {
  final _detailsController = Get.put(JournalsDetailsLogic(""));
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 280,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  onTap: () {
                    goBack();
                  },
                  child: Icon(Icons.arrow_back_ios, color: kColorPrimary)),
              title: Text(
                "Journal",
                style: TextStyle(color: kColorPrimary),
              ),
              //backgroundColor: Colors.white,
              elevation: 1,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/happy-woman.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Obx(() {
                            return Text(
                              _myAppointmentsController.getFormattedDate(
                                  int.parse(_detailsController.article.value
                                      .createdAt)) +
                                  " " +
                                  _myAppointmentsController.getFormattedTime(
                                      int.parse(_detailsController.article.value
                                          .createdAt)),
                              style: TextStyle(
                                color: Color(0xff40E58C),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }),
                          Obx(() {
                            return Text(
                              _detailsController.article.value.title,
                              style:
                              Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 16
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[350],
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return Text(_detailsController.article.value.text,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
