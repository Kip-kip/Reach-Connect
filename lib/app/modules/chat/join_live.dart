import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

import '../../shared/constants/colors.dart';
import '../../shared/utils/common_widget.dart';
import '../../shared/utils/session.dart';
import 'call/calls_controller.dart';


class JoinLive extends StatefulWidget {
  JoinLive(
      {Key? key,
      required this.roomName,
      this.callType,
      this.initiateCall,
      this.receiverName,
      this.doctorEmail})
      : super(key: key);

  final String? roomName;
  final String? callType;
  final bool? initiateCall;
  final String? receiverName;
  final String? doctorEmail;

  @override
  _JoinLiveState createState() =>
      _JoinLiveState(roomName!, doctorEmail!, receiverName!);
}

class _JoinLiveState extends State<JoinLive> {
  _JoinLiveState(String receiverUserId, String userId, String receiverName);

  final serverText = TextEditingController();
  final roomText = TextEditingController(text: SessionUtils.getMail());
  final subjectText = TextEditingController(text: "Live is in progress");
  final nameText = TextEditingController(text: "Attendee");

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
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Cc.kPrimaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: kIsWeb
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.30,
                    child: meetConfig(widget.roomName!,
                        widget.receiverName!, callsController),
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
            : meetConfig(
                widget.roomName!, widget.receiverName!, callsController),
      ),
    );
  }

  Container ImagePlaceholder() {
    return Container(
        width: 68.0,
        height: 68.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.black12, width: 0.5),
          image: DecorationImage(
              image: AssetImage('assets/images/avatar60.jpeg'),
              fit: BoxFit.cover),
        ));
  }

  void _muteVideo(bool torch) async {
    _onAudioOnlyChanged(torch);
  }

  void muteAudio(bool status) async {
    _onAudioMutedChanged(status);
  }

  void switchToLoudSpeaker(bool status) async {}

  Widget meetConfig(String receiverUserId, String receiverName,
      CallsController callsController) {
    return Container(
      color: Cc.kPrimaryColor,
      child: Stack(
        children: [
          Positioned.fill(
              top: (context.height) - 250,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: _joinMeeting,
                      child: Container(

                        child: FlatButton.icon(
                            onPressed: _joinMeeting,
                            icon: Icon(Icons.add_to_queue),
                            label: Text(
                              "Join Live Session",
                              style: TextStyle(color: Colors.white),
                            )),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                    ),
                  ])),
          Positioned.fill(
              top: Get.height / 3.5,
              child: Align(
                alignment: Alignment.center,
                child: Column(children: [
                  SvgPicture.asset("assets/images/brain2.svg"),
                  CommonWidget.rowHeight(height: 10),
                  Text("Join Live",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  CommonWidget.rowHeight(height: 10),
                  Text(
                      "You are about to join live on Tulivu safe space as ${SessionUtils.getMail()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                ]),
              )),
        ],
      ),
    );
  }

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
    var serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;
    var featureFlags = <FeatureFlagEnum, bool>{
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      FeatureFlagEnum.INVITE_ENABLED: true,
      FeatureFlagEnum.MEETING_NAME_ENABLED: true
    };
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        featureFlags[FeatureFlagEnum.INVITE_ENABLED] = false;
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

    Map<FeatureFlagEnum, bool> featureFlagsx = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (true) {
      if (Platform.isAndroid) {
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        featureFlags[FeatureFlagEnum.ADD_PEOPLE_ENABLED] = false;
        featureFlags[FeatureFlagEnum.CALENDAR_ENABLED] = false;
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        featureFlags[FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED] = false;
        featureFlags[FeatureFlagEnum.CHAT_ENABLED] = true;
        featureFlags[FeatureFlagEnum.INVITE_ENABLED] = false;
        featureFlags[FeatureFlagEnum.IOS_RECORDING_ENABLED] = false;
        featureFlags[FeatureFlagEnum.LIVE_STREAMING_ENABLED] = true;
        featureFlags[FeatureFlagEnum.MEETING_NAME_ENABLED] = false;
        featureFlags[FeatureFlagEnum.MEETING_PASSWORD_ENABLED] = false;
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
        featureFlags[FeatureFlagEnum.RAISE_HAND_ENABLED] = false;
        featureFlags[FeatureFlagEnum.RECORDING_ENABLED] = false;
        featureFlags[FeatureFlagEnum.TILE_VIEW_ENABLED] = false;
        featureFlags[FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE] = false;
        featureFlags[FeatureFlagEnum.WELCOME_PAGE_ENABLED] = false;
      } else if (Platform.isIOS) {
// Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }

    // Define meetings options here
    var options = JitsiMeetingOptions(room: widget.roomName!)
      ..serverURL = serverUrl
      ..subject = subjectText.text
      ..userDisplayName = widget.receiverName
      ..userAvatarURL = SessionUtils.getAvatarLink(widget.doctorEmail!)
      ..userEmail = SessionUtils.getMail()!
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = false
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": widget.roomName!,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": widget.receiverName}
      };

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
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
