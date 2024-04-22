import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class AppBarTitleWidget extends StatelessWidget {
  final double size;
  const AppBarTitleWidget(
      {Key? key,
      required this.size,
      }

      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Icon(
        //   Icons.add,
        //   color: kColorPink,
        // ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Bridge',
                style: TextStyle(
                  color: kColorGreen,
                  fontSize: size,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'ME',
                style: TextStyle(
                  color: kColorOldPrimary,

                  fontSize: size,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppBarTitleWidget2 extends StatelessWidget {
  final double size;
  const AppBarTitleWidget2(
      {Key? key,
        required this.size,
      }

      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Icon(
        //   Icons.add,
        //   color: kColorPink,
        // ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Bridge',
                style: TextStyle(
                  color: kColorGreen,
                  fontSize: size,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'ME',
                style: TextStyle(
                  color: Colors.white,

                  fontSize: size,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
