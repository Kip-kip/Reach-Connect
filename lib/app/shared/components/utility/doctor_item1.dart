import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../models/consultant/doctor.dart';
import '../../utils/utils.dart';



class DoctorItem1 extends StatelessWidget {
  final TherapistEntity therapist;

  const DoctorItem1({
    Key? key,
    required this.therapist,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 50,
            height: 50,
            imageUrl: SessionUtils.getAvatarLink(therapist.email!),
            placeholder: (context, url) =>
                ImagePlaceholder(),
            errorWidget: (context, url, error) =>
                ImagePlaceholder(),
            imageBuilder: (context, imageProvider) =>
                Stack(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50.0)),
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Dr. "+therapist.fullName!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  therapist.category??"",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
