import 'package:bridgme/app/modules/chat/widgets/msg/msg_box.dart';
import 'package:bridgme/app/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
          UserAvatar(image: image,size: 25,),
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

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.image, required this.size,
  }) : super(key: key);

  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: size,
      height: size,
      fit: BoxFit.fill,
      imageUrl: image,
      placeholder: (context, url) =>ImagePlaceholder(width: size),
      errorWidget: (context, url, error) => ImagePlaceholder(width: size),
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
