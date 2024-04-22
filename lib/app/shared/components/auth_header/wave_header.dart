
import 'package:flutter/material.dart';

import '../appbar/app_bar_title_widget.dart';
import 'custom_wave_clipper_header.dart';



class WaveHeader extends StatelessWidget {
  final String title;

  const WaveHeader({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = Size(MediaQuery.of(context).size.width, 350);
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          CustomWaveClipperHeader(
            size: size,
            xOffset: 0,
            yOffset: 0,
          ),
          CustomWaveClipperHeader(
            size: size,
            xOffset: 50,
            yOffset: 10,
            duration: 1500,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'assets/images/1.5x/icon_start.png',
                  color: Colors.white,
                  height: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppBarTitleWidget2(size:20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
