

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../../shared/components/utility/custom_button.dart';
import '../../../../../../../shared/constants/constants.dart';
import '../../../../../../../shared/utils/utils.dart';
import '../widgets/availability_widget.dart';
import '../widgets/consultation_fee_widget.dart';
import '../widgets/gender_widget.dart';
import '../widgets/sort_widget.dart';



class FilterPage extends StatelessWidget {
  late Color _color = Colors.white54;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorGreen,
        leading: GestureDetector(
            onTap: (){
              goBack();
            },
            child: Icon(Icons.close,color: Colors.white)),
        centerTitle: true,
        title: Text(
          'Filter'.tr(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SortWidget(
                      color: _color,
                    ),
                    AvailabilityWidget(
                      color: _color,
                    ),
                    GenderWidget(
                      color: _color,
                    ),
                    ConsultationFeeWidget(
                      color: _color,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                onPressed: () {},
                text: 'Apply'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
