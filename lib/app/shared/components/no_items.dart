import 'package:bridgme/app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../utils/common_widget.dart';

class NoItems extends StatelessWidget {
  final String imagePath;
  final String title;
  final String message;
  final bool showBackButton;

  Function? callback;

  NoItems(
      {Key? key,
        required this.imagePath,
        required this.title,
        required this.message,
        required this.showBackButton,
        this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 21, left: 21, bottom: 29),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    imagePath,
                    height: 139,
                    width: 200,
                  ),
                  CommonWidget.rowHeight(height: 39),
                  Text(title,
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  CommonWidget.rowHeight(height: 4),
                  Text(
                    message,
                    style: TextStyle(color: Colors.black45, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Spacer(),
            showBackButton
                ? FlatButton(
                minWidth: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                color: Cc.kPrimaryColor,
                onPressed: () {
                  if (callback != null) {
                    callback!();
                    return;
                  }
                  goBack();
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ))
                : SizedBox(),
          ]),
    );
  }
}