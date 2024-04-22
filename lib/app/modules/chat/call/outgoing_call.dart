import 'dart:io';

import 'package:bridgme/models/chat/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

import '../../../shared/utils/session.dart';
import 'calls_controller.dart';


class OutgoingCall extends StatefulWidget {
  OutgoingCall(
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
  _OutgoingCallState createState() =>
      _OutgoingCallState(receiverUserId!, userId!, receiverName!);
}

class _OutgoingCallState extends State<OutgoingCall> {
  _OutgoingCallState(String receiverUserId, String userId, String receiverName);

  final serverText = TextEditingController();
  final roomText = TextEditingController(text: SessionUtils.getMail());
  final subjectText = TextEditingController(text: "Consultation in progress");
  final nameText = TextEditingController(text: "Plugin Test User");
  final emailText = TextEditingController(text: "fake@email.com");

  final iosAppBarRGBAColor =
      TextEditingController(text: "#0080FF80"); //transparent blue
  bool? isAudioOnly = true;
  bool? isAudioMuted = false;
  bool? isVideoMuted = true;
  var callsController = CallsController();

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
    _joinMeeting();
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: kIsWeb
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.30,
                  child: meetConfig(),
                ),
                Container(
                    width: width * 0.60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          color: Colors.white54,
                          child: SizedBox(
                            width: width * 0.60 * 0.70,
                            height: width * 0.60 * 0.70,
                            child: JitsiMeetConferencing(
                              extraJS: [
                                // extraJs setup example
                                '<script>function echo(){console.log("echo!!!")};</script>',
                                '<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>'
                              ],
                            ),
                          )),
                    ))
              ],
            )
          : meetConfig(),
    );
  }

  void _muteVideo(bool torch) async {
    _onAudioOnlyChanged(torch);
  }

  void muteAudio(bool status) async {
    _onAudioMutedChanged(status);
  }

  void switchToLoudSpeaker(bool status) async {}

  _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting() async {
    String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        featureFlags[FeatureFlagEnum.INVITE_ENABLED] = false;
        featureFlags[FeatureFlagEnum.RAISE_HAND_ENABLED] = false;
        // featureFlags[FeatureFlagEnum.RAISE_HAND_ENABLED] = false;
        // featureFlags[FeatureFlagEnum.RECORDING_ENABLED] = false;
        // featureFlags[FeatureFlagEnum.TILE_VIEW_ENABLED] = true;
        // featureFlags[FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE] = false;
        // featureFlags[FeatureFlagEnum.WELCOME_PAGE_ENABLED] = true;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }

    // Define meetings options here
    var options = JitsiMeetingOptions(room: widget.userId!)
      ..serverURL = serverUrl
      ..subject = widget.userId
      ..userDisplayName = widget.receiverName
      ..userAvatarURL = SessionUtils.getAvatarLink(widget.receiverUserId!)
      ..userEmail = SessionUtils.getMail()!
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = widget.callType == Message.kVOICE_CALL
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": SessionUtils.getMail()!,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": widget.receiverName}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    Get.back();
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }

  Widget meetConfig() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: serverText,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Server URL",
                hintText: "Hint: Leave empty for meet.jitsi.si"),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: roomText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Room",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: subjectText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Subject",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: nameText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Display Name",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: emailText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: iosAppBarRGBAColor,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "AppBar Color(IOS only)",
                hintText: "Hint: This HAS to be in HEX RGBA format"),
          ),
          SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: Text("Audio Only"),
            value: isAudioOnly,
            onChanged: _onAudioOnlyChanged,
          ),
          SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: Text("Audio Muted"),
            value: isAudioMuted,
            onChanged: _onAudioMutedChanged,
          ),
          SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: Text("Video Muted"),
            value: isVideoMuted,
            onChanged: _onVideoMutedChanged,
          ),
          Divider(
            height: 48.0,
            thickness: 2.0,
          ),
          SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                _joinMeeting();
              },
              child: Text(
                "Join Meeting",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue)),
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
        ],
      ),
    );
  }
}
