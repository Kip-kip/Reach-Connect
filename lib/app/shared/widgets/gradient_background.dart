import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../constants/colors.dart';

class GradientBackground extends StatelessWidget {
  final bool needWave;
  final Widget? child;
  final bool needTopSafeArea;
  final bool needTopRadius;
  final String imageUrl;
  final String title;

  GradientBackground({
    Key? key,
    this.needWave = true,
    this.needTopSafeArea = true,
    this.needTopRadius = false,
    this.title = "",
    this.imageUrl =
        "https://www.helpguide.org/wp-content/uploads/crop-woman-breaking-cigarette-and-quitting-smoking-1536.jpg",
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return needTopSafeArea
        ? Container(
            color: Theme.of(context).colorScheme.primaryVariant,
            child: SafeArea(
              child: _buildBackground(context),
            ),
          )
        : _buildBackground(context);
  }

  Widget _buildBackground(BuildContext context) {
    double pos = context.height / 4;
    var needTopRadius = false;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.fitHeight,
            ),
            borderRadius: needTopRadius
                ? BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )
                : null,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.9],
              colors: [
                hexToColor('#405FA3'),
                hexToColor('#1ED69D'),
              ],
            ),
          ),
          child: child,
        ),
        if (needWave)
          Positioned(
            bottom: 0,
            left: 0,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [hexToColor('#2BA99F'), hexToColor('#22CC9E')],
                  [hexToColor('#2BA99F'), hexToColor('#3BCDAD')],
                  [hexToColor('#3CC8AE'), hexToColor('#22C69E')],
                  [hexToColor('#55D5B1'), hexToColor('#54D9B1')]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 1),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 20,
              size: Size(
                MediaQuery.of(context).size.width,
                60.0,
              ),
            ),
          ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.topLeft,
          child: Container(
              color: title.isEmpty
                  ? Color.fromRGBO(0, 0, 0, 0.2)
                  : Color.fromRGBO(0, 0, 0, 0.4),
              // decoration: BoxDecoration(),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: pos, left: 16),
                child: Container(
                    width: context.width * 0.85,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Cc.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              )),
        )),
        Positioned(
            left: 8,
            top: 53,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    // color: Cc.kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 40,
                width: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/backarrow.svg",
                    height: 11.62,
                    width: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

class GradientBackground2 extends StatelessWidget {
  final bool needWave;
  final Widget? child;
  final bool needTopSafeArea;
  final bool needTopRadius;
  final String imageUrl;
  final String title;

  GradientBackground2({
    Key? key,
    this.needWave = true,
    this.needTopSafeArea = true,
    this.needTopRadius = false,
    this.title = "",
    this.imageUrl =
    "https://www.helpguide.org/wp-content/uploads/crop-woman-breaking-cigarette-and-quitting-smoking-1536.jpg",
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return needTopSafeArea
        ? Container(
      color: Theme.of(context).colorScheme.primaryVariant,
      child: SafeArea(
        child: _buildBackground(context),
      ),
    )
        : _buildBackground(context);
  }

  Widget _buildBackground(BuildContext context) {
    double pos = context.height / 4;
    var needTopRadius = false;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: needTopRadius
                ? BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            )
                : null,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.9],
              colors: [
                hexToColor('#405FA3'),
                hexToColor('#1ED69D'),
              ],
            ),
          ),
          child: child,
        ),
        if (needWave)
          Positioned(
            bottom: 0,
            left: 0,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [hexToColor('#2BA99F'), hexToColor('#22CC9E')],
                  [hexToColor('#2BA99F'), hexToColor('#3BCDAD')],
                  [hexToColor('#3CC8AE'), hexToColor('#22C69E')],
                  [hexToColor('#55D5B1'), hexToColor('#54D9B1')]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 1),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 20,
              size: Size(
                MediaQuery.of(context).size.width,
                60.0,
              ),
            ),
          ),
        Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                  color: title.isEmpty
                      ? Color.fromRGBO(0, 0, 0, 0.2)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                  // decoration: BoxDecoration(),
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: pos, left: 16),
                    child: Container(
                        width: context.width * 0.85,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Cc.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  )),
            )),
        Positioned(
            left: 8,
            top: 53,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  // color: Cc.kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 40,
                width: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/backarrow.svg",
                    height: 11.62,
                    width: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
