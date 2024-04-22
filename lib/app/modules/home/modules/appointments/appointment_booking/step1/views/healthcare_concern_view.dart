import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../shared/components/utility/health_concern_item.dart';
import '../../../../../../../shared/constants/constants.dart';
import '../../../../../widgets/custom_app_bar.dart';
import '../controllers/healthcare_concern_logic.dart';


class HealthcareConcernPage extends StatelessWidget {
  final _healthcareController = Get.put(HealthcareConcernLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(appBarText: "Health Concern",)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Choose health concern"
                            .toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6!
                            .copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    _healthcareController.articleCategories.value.length < 1 ?
                    Center(child: Padding(
                      padding: const EdgeInsets.only(top:200),
                      child: Text("There are no health concern categories at the moment",style: TextStyle(fontWeight: FontWeight.bold),),
                    )) :
                    StaggeredGridView.countBuilder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      crossAxisCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _healthcareController.articleCategories
                          .length,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return HealthConcernItem(
                            articleCategory: _healthcareController
                                .articleCategories[index],
                            onTap: () {
                              Map<String, String> params = {"categoryId":_healthcareController.articleCategories[index].categoryid??""};
                              Get.rootDelegate.toNamed(Routes.CHOOSE_DOCTOR,parameters: params);
                            },
                          );
                        });
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
