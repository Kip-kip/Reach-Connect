import 'package:bridgme/app/modules/home/modules/counsellor/counsellor_profile/controllers/counsellor_profile_logic.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../shared/components/utility/custom_circular_indicator.dart';
import '../../../../../../shared/constants/constants.dart';
import '../../../../../../shared/utils/utils.dart';

class CounsellorProfilePage extends GetView<CounsellorProfileLogic> {
  final _counsellorProfileController = Get.put(CounsellorProfileLogic(""));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 280,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () {
                    goBack();
                  },
                  child: Icon(Icons.arrow_back_ios, color: kColorPrimary)),
              title: Obx(() {
                return Text(
                  "Dr. " + controller.therapist.value.fullName!,
                  style: TextStyle(color: kColorPrimary),
                );
              }),
              flexibleSpace: FlexibleSpaceBar(
                background: Obx(() {
                  return Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: CachedNetworkImageProvider(
                            SessionUtils.getAvatarLink(
                                _counsellorProfileController
                                    .therapist.value.email!)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
            )
          ];
        },
        body: Obx(() {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: _counsellorProfileController.therapist.value.email == ""
                  ? Container(
                      height: Get.height * 0.3,
                      child: Center(
                          child: SizedBox(
                              height: 35, child: CircularProgressIndicator())),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Obx(() {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _counsellorProfileController.therapist
                                                  .value.availabilityStatus ??
                                              false
                                          ? "Available Now"
                                          : "Not Available",
                                      style: TextStyle(
                                        color: _counsellorProfileController
                                                    .therapist
                                                    .value
                                                    .availabilityStatus ??
                                                false
                                            ? Color(0xff40E58C)
                                            : Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "Dr. " +
                                          _counsellorProfileController
                                              .therapist.value.fullName
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    Text(
                                      _counsellorProfileController
                                          .therapist.value.category
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RatingBar(
                              itemSize: 20,
                              initialRating: 4.5,
                              allowHalfRating: false,
                              itemCount: 5,
                              ignoreGestures: true,
                              // itemBuilder: (context, _) => Icon(
                              //   Icons.star,
                              //   color: Colors.amber,
                              // ),
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                half: SizedBox(),
                                empty: Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey[350],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomCircularIndicator(
                              radius: 80,
                              percent: _counsellorProfileController
                                      .therapist.value.review! /
                                  100,
                              lineWidth: 5,
                              line1Width: 2,
                              footer: 'Good reviews',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomCircularIndicator(
                              radius: 80,
                              percent: _counsellorProfileController
                                      .therapist.value.totalScore! /
                                  100,
                              lineWidth: 5,
                              line1Width: 2,
                              footer: 'Total score',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomCircularIndicator(
                              radius: 80,
                              percent: _counsellorProfileController
                                      .therapist.value.satisfaction! /
                                  100,
                              lineWidth: 5,
                              line1Width: 2,
                              footer: 'Satisfaction',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey[350],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'About',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          _counsellorProfileController.therapist.value.bio
                              .toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: _counsellorProfileController
                                          .therapist.value.availabilityStatus ??
                                      false
                                  ? RawMaterialButton(
                                      onPressed: () {
                                        Get.rootDelegate.toNamed(
                                            Routes.TIME_SLOT_PAGE,
                                            parameters: {
                                              "therapistId":
                                                  controller.therapistId
                                            });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      fillColor: kColorGreen,
                                      child: Container(
                                        height: 48,
                                        child: const Center(
                                          child: Text(
                                            'Book An Appointment',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            )
                          ],
                        )
                      ],
                    ),
            ),
          );
        }),
      ),
    );
  }
}
