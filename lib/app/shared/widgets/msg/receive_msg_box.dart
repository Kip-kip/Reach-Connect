import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'msg_box.dart';

class ReceiveMsgBox extends MsgBox {
  final String message;
  final String image;
  final String time;
  final AnimationController animationController;

  const ReceiveMsgBox({
    Key? key,
    required this.message,
    required this.animationController,
    required this.image,
    required this.time
  }) : super(key: key, animationController: animationController);

  @override
  Widget buildWidgets(BuildContext context) {
    final messageTextGroup = Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: 25,
            height: 25,
            fit: BoxFit.fill,
            imageUrl: image,
            placeholder: (context, url) => Image(
              image: AssetImage('assets/images/icon_success.png'),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(width: 10),
          // Transform(
          //   alignment: Alignment.center,
          //   transform: Matrix4.rotationY(math.pi),
          //   child: CustomPaint(painter: MsgArrowPainter(Colors.white)),
          // ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top:14,left: 14, right: 14, bottom: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Column(

                crossAxisAlignment:  CrossAxisAlignment.end,
                children: [
                  Text(
                    message,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(time, style:TextStyle(fontSize: 9,color: Colors.grey), textAlign: TextAlign.right,  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.only(right: 50.0, left: 10, top: 10, bottom: 5),
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
