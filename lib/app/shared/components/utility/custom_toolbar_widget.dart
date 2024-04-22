import 'package:bridgme/app/shared/constants/base_constants.dart';
import 'package:bridgme/app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../utils/common_widget.dart';


class CustomToolBarWidget extends StatelessWidget {
  final String title;
  final Function? callback;
  final Function? callback2;
  final Icon? rightIcon;
  final Icon? rightIconTwo;
  final Function? gobackCallback;

  const CustomToolBarWidget({Key? key,
    required this.title,
    this.callback,
    this.rightIcon,
    this.rightIconTwo,
    this.callback2,
    this.gobackCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Colors.black26,
                width: 1.5,
              ))),
      child: Container(
        margin: EdgeInsets.only(left: 14, right: 16, bottom: 8),
        child: InkWell(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (gobackCallback == null) {
                    Get.back();
                  } else {
                    gobackCallback!();
                  }
                },
                focusColor: Colors.white,
                highlightColor: Colors.white ,
                child: Padding(
                  padding: const EdgeInsets.only(top:0.0, bottom: 0),
                  child: Container(
                    height: 20,
                    child: Icon(Icons.arrow_back_ios_new_rounded, color: kColorPrimary),
                  ),
                ),
              ),
              InkWell(child: CommonWidget.rowWidth(width: 14),
                focusColor: Colors.white,
                highlightColor: Colors.white ,
                onTap: () {
                  if (gobackCallback == null) {
                    Get.back();
                  } else {
                    gobackCallback!();
                  }
                },
              ),
              InkWell(

                child: Text(title,
                    style: TextStyle(
                        color:  kColorPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Spacer(),
              // Icon(Icons.delete_outline_rounded, color: ColorConstants.kPrimaryColor),
              rightIcon == null
                  ? SizedBox()
                  : IconButton(
                  onPressed: () {
                    callback!();
                  },
                  icon: rightIcon!),

              rightIconTwo == null
                  ? SizedBox()
                  : IconButton(
                  onPressed: () {
                    callback2!();
                  },
                  icon: rightIconTwo!),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomToolBarWidgetx extends StatelessWidget {
  final String title;
  final Function? callback;
  final Function? callback2;
  final Text? rightIcon;
  final Icon? rightIconTwo;
  final Function? gobackCallback;

  const CustomToolBarWidgetx({Key? key,
    required this.title,
    this.callback,
    this.rightIcon,
    this.rightIconTwo,
    this.callback2,
    this.gobackCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Colors.black26,
                width: 1.5,
              ))),
      child: Container(
        margin: EdgeInsets.only(left: 14, right: 16, bottom: 8),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (gobackCallback == null) {
                  Get.back();
                } else {
                  gobackCallback!();
                }
              },
              child: Container(
                height: 20,
                child: SvgPicture.asset(
                  "assets/images/backarrow.svg",
                  height: 11.62,
                  width: 24,
                  color: Colors.black,
                ),
              ),
            ),
            CommonWidget.rowWidth(width: 14),
            Text(title,
                style: TextStyle(
                    color: Cc.kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Spacer(),
            // Icon(Icons.delete_outline_rounded, color: ColorConstants.kPrimaryColor),
            rightIcon == null
                ? SizedBox()
                : TextButton(

              child: rightIcon!, onPressed: () {
              callback!();
            },
            ),

            rightIconTwo == null
                ? SizedBox()
                : IconButton(
                onPressed: () {
                  callback2!();
                },
                icon: rightIconTwo!),
          ],
        ),
      ),
    );
  }
}
