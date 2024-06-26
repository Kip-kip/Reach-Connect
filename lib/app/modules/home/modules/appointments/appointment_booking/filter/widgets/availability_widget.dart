import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum Availability { anyDay, today, next3Days, commingWeekend }

class AvailabilityWidget extends StatefulWidget {
  final Color color;

  const AvailabilityWidget({
    Key? key,
    required this.color,
  }) : super(key: key);
  @override
  _AvailabilityWidgetState createState() => _AvailabilityWidgetState();
}

class _AvailabilityWidgetState extends State<AvailabilityWidget> {
  Availability _availability = Availability.anyDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: widget.color,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'Availability'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        RadioListTile(
          value: Availability.anyDay,
          onChanged: (Availability? value) {
            setState(() {
              _availability = value!;
            });
          },
          groupValue: _availability,
          title: Text('Available any day'.tr()),
        ),
        RadioListTile(
          value: Availability.today,
          onChanged: (Availability? value) {
            setState(() {
              _availability = value!;
            });
          },
          groupValue: _availability,
          title: Text('Available today'.tr()),
        ),
        RadioListTile(
          value: Availability.next3Days,
          onChanged: (Availability? value) {
            setState(() {
              _availability = value!;
            });
          },
          groupValue: _availability,
          title: Text('Available in next 3 days'.tr()),
        ),
        RadioListTile(
          value: Availability.commingWeekend,
          onChanged: (Availability? value) {
            setState(() {
              _availability = value!;
            });
          },
          groupValue: _availability,
          title: Text('Available coming weekend'.tr()),
        )
      ],
    );
  }
}
