import 'package:cloud_firestore_odm/annotation.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/appointment/health_category.dart';
import '../../../../../../../../models/article/article_category_entity.dart';



class HealthcareConcernLogic extends GetxController {

  @Collection<ArticleCategoryEntity>('article_category')
  final articleCategoryRef = ArticleCategoryEntityCollectionReference();

  var articleCategories = <ArticleCategoryEntity>[].obs;
  @override
  void onReady() {
    super.onReady();
    loadCategories();
  }


  loadCategories(){

    articleCategories.bindStream(articleCategoryRef
        .orderByViews(descending: true)
        .limit(5)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));


    // healthCategories.value = [
    //   HealthCategory(
    //     id: 0,
    //     name: 'Women health',
    //     imagePath: 'assets/images/pregnant.png',
    //   ),
    //   HealthCategory(
    //     id: 1,
    //     name: 'Skin',
    //     imagePath: 'assets/images/personal-care.png',
    //   ),
    //   HealthCategory(
    //     id: 2,
    //     name: 'Child',
    //     imagePath: 'assets/images/baby.png',
    //   ),
    //   HealthCategory(
    //     id: 3,
    //     name: 'General physician',
    //     imagePath: 'assets/images/stethoscope.png',
    //   ),
    //   HealthCategory(
    //     id: 4,
    //     name: 'Dental',
    //     imagePath: 'assets/images/dental-care.png',
    //   ),
    //   HealthCategory(
    //     id: 5,
    //     name: 'Ear',
    //     imagePath: 'assets/images/throat.png',
    //   ),
    //   HealthCategory(
    //     id: 6,
    //     name: 'Homoetherapy',
    //     imagePath: 'assets/images/medicine.png',
    //   ),
    // ];

  }



}
