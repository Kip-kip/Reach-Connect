import 'package:bridgme/models/availability/availability.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';


class DaySlotItem extends StatelessWidget {
  final bool selected;
  final Availability availability;
  final void Function() onTap;

  const DaySlotItem({
    Key? key,
    required this.selected,
    required this.availability,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selected ? Cc.kPrimaryColor : Colors.grey,
            width: 2, //selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Text(
              DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(availability.day!))
              ,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: kColorPrimaryDark, fontWeight: FontWeight.w600),
            ),
            Text(
              '${availability.morningSlots!.length} Slots available',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
