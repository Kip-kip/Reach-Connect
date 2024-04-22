import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/msg/msg_box.dart';



class SendMsgBox extends MsgBox {
  final String message;
  final AnimationController animationController;
  final String image;
  final String time;
  const SendMsgBox(
      {Key? key, required this.message, required this.animationController, required this.image, required this.time})
      : super(key: key, animationController: animationController);

  @override
  Widget buildWidgets(BuildContext context) {
    final messageTextGroup = Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top:14,left: 14, right: 14, bottom: 4),
              decoration: BoxDecoration(
                color: Cc.kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.black45, fontSize: 9, ),
                  ),
                ],
              ),
            ),
          ),
          // CustomPaint(painter: MsgArrowPainter( Cc.kPrimaryColor)),
          SizedBox(width: 10),
          CachedNetworkImage(
            width: 25,
            height: 25,
            fit: BoxFit.fill,
            imageUrl: image,
            placeholder: (context, url) => Image(
              image: AssetImage('assets/images/icon_success.png'),
            ),
            imageBuilder: (context, imageProvider) => Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.only(right: 10.0, left: 50, top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}
