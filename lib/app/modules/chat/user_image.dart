import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/user/user_model_entity.dart';


class UserImage extends StatefulWidget {
  const UserImage({
    Key? key,
    required this.user,
    required this.token,
    this.width,
    this.email,

  }) : super(key: key);

  final UserModelEntity user;
  final String token;
  final double? width;
  final String? email;

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  var isFailed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(

          radius: this.widget.width == null || this.widget.width == 0
              ? 35.0
              : this.widget.width,
          onBackgroundImageError: (o, s) {
            print("Image loading failed ");
            setState(() {
              isFailed = true;
            });
          },
          backgroundImage: AssetImage("assets/images/avatar60.jpeg"),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }

  void onError(Object exception, StackTrace stackTrace) {}
}
