import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as GX;
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'calls_controller.dart';


class CallsPage extends StatefulWidget {
  CallsPage(
      {Key? key,
        required this.receiverUserId,
        this.callType,
        this.initiateCall,
        this.receiverName,
        this.userId})
      : super(key: key);

  final String? receiverUserId;
  final String? callType;
  final bool? initiateCall;
  final String? receiverName;
  final String? userId;

  @override
  _CallsPageState createState() =>
      _CallsPageState(receiverUserId!, userId!, receiverName!);
}

class _CallsPageState extends State<CallsPage> {
  _CallsPageState(String s, String userId, String t);

  @override
  Widget build(BuildContext context) {

   return Container(child:Text("Not in use"));
  }

}
