import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  double? verticalHeight = 10;

  SectionHeaderWidget({
    Key? key,
    required this.title,
    this.onPressed,
    this.verticalHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalHeight == null ? 10 : verticalHeight!),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          onPressed != null
              ? TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "See All",
                    style: TextStyle(color: kColorPrimary),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
