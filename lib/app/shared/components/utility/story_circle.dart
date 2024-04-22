import 'package:bridgme/app/shared/utils/session.dart';
import "package:flutter/material.dart";

import '../../../../models/user/user_model_entity.dart';
import 'circle_gradient_border.dart';

class StoryCircle extends StatelessWidget {
  final Function press;
  final UserModelEntity user;
  final double size;
  final double tickBorder;

  const StoryCircle({
    required this.press,
    required this.user,
    required this.size,
    required this.tickBorder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
          margin: EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 0),
          child: Column(
            children: [
              CircleGradientBorder(
                  url: SessionUtils.getAvatarLink(user.email!),
                  width: size,
                  height: size,
                  tickBorder: tickBorder),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(user.fullname!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black)),
              )
            ],
          )),
    );
  }
}
