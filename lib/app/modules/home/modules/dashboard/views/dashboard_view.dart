import 'package:bridgme/app/shared/shared.dart';
import 'package:bridgme/models/user/user_model_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../shared/components/utility/story_circle.dart';
import '../../../../../shared/utils/session.dart';
import '../../stories/views/story_view.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/next_appointment_widget.dart';
import '../widgets/no_appointments_widget.dart';
import '../widgets/section_header_widget.dart';
import '../widgets/test_and_prescription_card_widget.dart';
import '../widgets/visited_counsellor_list_item.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with AutomaticKeepAliveClientMixin<DashboardPage> {
  final bool _noAppoints = true;
  DashboardController controller = Get.put(DashboardController());

  RefreshController _refreshController = RefreshController(
      initialRefresh: false);

  void _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Obx(() {
            //   return FlatButton(onPressed: () {
            //     controller.createCategory();
            //   },
            //       child: Text(" Cool buttons ${controller.stories.length}"));
            // }),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            // bottom: BorderSide(width: 1, color: Colors.grey[300]!),
                          ),
                        ),
                        height: 115,
                        child: Obx(() {
                          return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: controller.userStories.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (index == 100000000000) {
                                  return Container(child: Text(
                                      "${controller.userStories.length}"),);
                                } else {
                                  return StoryCircle(
                                      press: () {
                                        controller.selectedUserStory.add(
                                            controller.userStories[index]);
                                        Get.rootDelegate.toNamed(
                                            Routes.STORY_PAGE);
                                      },
                                      user: controller.userStories.map((
                                          element) {
                                        var user = UserModelEntity();
                                        user.fullname = element.user;
                                        user.email = element.owner;
                                        return user;
                                      }).toList()[index],
                                      size: 75,
                                      tickBorder: 3.0);
                                }
                              });
                        }),
                      ))
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 20),
                  child: Column(
                    children: <Widget>[
                      _noAppoints ? SectionHeaderWidget(
                        title: 'Next appointment',

                      ) : SectionHeaderWidget(
                        title: 'Find the help you need ',
                      ),
                      CommonWidget.rowHeight(height: 7),
                      Obx(() {
                        return Container(child: controller.upcomingAppointments
                            .isNotEmpty
                            ? NextAppointmentWidget(appointment:
                            controller.upcomingAppointments.value.first,
                            therapist: controller.therapist.value)
                            : NoAppointmentWidgeOne(), );
                      }),
                      SectionHeaderWidget(
                        title: 'Top therapists',
                        onPressed: () {
                          Get.rootDelegate.toNamed(Routes.COUNSELLORLIST);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 160,
                  child: Obx(() {
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            width: 15,
                          ),
                      itemCount: controller.doctors.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return VisitedCounsellorListItem(
                          doctor: controller.doctors.value[index],
                        );
                      },
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SectionHeaderWidget(
                        title: 'Top picks',
                        onPressed: () {
                          Get.rootDelegate.toNamed(Routes.JOURNAL_LIST);
                        },
                      ),
                      Container(
                        height: Get.height * 0.3,
                        child: SmartRefresher(
                          controller: _refreshController,
                          onRefresh: _onRefresh,
                          child: Obx(() {
                            return ListView.builder(
                                itemCount: controller.articleCategories.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var category = controller
                                      .articleCategories[index];
                                  return TestAndPrescriptionCardWidget(
                                    title: category.title!,
                                    subtitle: category.subtitle!,
                                    image: 'love.png',
                                    onTap: () {
                                      Map<String, String> params = {"categoryId":category.categoryid??""};
                                      Get.rootDelegate.toNamed(Routes.ARTICLES,parameters: params);
                                    },
                                  );
                                });
                          }),
                        ),
                      ),
                      //test results
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
