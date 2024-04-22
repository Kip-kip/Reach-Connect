
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/components/utility/custom_button.dart';
import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/utils/custom_outline_button.dart';




class UpcomingAppointmentListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kColorLight,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: _buildColumn(
                          context: context,
                          title: 'Date'.tr(),
                          subtitle: '18 Juin 2020',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: _buildColumn(
                          context: context,
                          title: 'Time'.tr(),
                          subtitle: '09:30',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: _buildColumn(
                          context: context,
                          title: 'Doctor'.tr(),
                          subtitle: 'Dr. Faith Chepkosge',
                        ),
                      ),
                      Expanded(
                        child: _buildColumn(
                          context: context,
                          title: 'Speciality'.tr(),
                          subtitle: 'Family Doctor',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Edit'.tr(),
                      textSize: 14,
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    child: CustomOutlineButton(
                      text: 'Cancel'.tr(),
                      textSize: 14,
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _buildColumn({
    required BuildContext context,
    required String title,
    required subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "subtitle",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
