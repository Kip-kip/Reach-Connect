import 'dart:async';

import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:bridgme/models/stories/story_model.dart';
import 'package:bridgme/models/stories/user_story.dart';
import 'package:bridgme/models/user/user_model_entity.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '../../../../../../models/appointment/appointment_model.dart';
import '../../../../../../models/article/article_category_entity.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/profile_controller.dart';

class DashboardController extends GetxController {
  final now = DateTime.now().obs;
  var currentUser = "";
  var latestAppointment = AppointmentModel(
    id: "",
    appointmentDate: 0,
    completed: false,
    doctorEmail: "",
    patientEmail: "",
    status: "",
    doctorBill: 0,
    paidAmount: 0,
    doctorName: "",
    doctorImage: "",
  ).obs;

  @Collection<StoryModel>('story_model')
  final storyModelRef = StoryModelCollectionReference();

  @Collection<TherapistEntity>('consultant')
  final therapistRef = TherapistEntityCollectionReference();

  @Collection<ArticleCategoryEntity>('article_category')
  final articleCategoryRef = ArticleCategoryEntityCollectionReference();

  List<UserModelEntity> users = <UserModelEntity>[];
  var doctors = <TherapistEntity>[].obs;
  var stories = <StoryModel>[].obs;
  var userStories = <UserStory>[].obs;
  var selectedUserStory = <UserStory>[].obs;
  var selectedTherapist = <TherapistEntity>[].obs;
  var articleCategories = <ArticleCategoryEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    if (SessionUtils.getMail() == null || SessionUtils.getMail()!.isEmpty) {
      UserProfileController _profileController =
          Get.put(UserProfileController());
      _profileController.signOut();
      Get.rootDelegate.toNamed(Routes.LOGIN);
    }
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        now.value = DateTime.now();
      },
    );
  }

  @override
  void onInit() {
    if (SessionUtils.getMail() == null || SessionUtils.getMail()!.isEmpty) {
      UserProfileController _profileController =
      Get.put(UserProfileController());
      _profileController.signOut();
      Get.rootDelegate.toNamed(Routes.LOGIN);
    }
    watchStories();
    getStories();
    getConsultants();
    getArticleCategories();
    getNextAppointment(currentUser);
    loadUpcomingAppointments();
    super.onInit();
  }

  getNextAppointment(userID) {
    latestAppointment.value = AppointmentModel(
      id: "1234",
      appointmentDate: 1647269664,
      completed: false,
      doctorEmail: "akikomali@gmail.com",
      patientEmail: "damiandelf@gmail.com",
      status: "Pending",
      doctorBill: 3000,
      paidAmount: 1500,
      doctorName: "Dr Aiko Mali",
      doctorImage: "",
    );

    loadTherapistDetails(latestAppointment.value.doctorEmail);
  }

  var therapist = TherapistEntity(
          email: "",
          bio: "",
          fullName: "",
          specialty: "",
          availabilityStatus: true,
          price: 0,
          review: 0,
          totalScore: 0,
          satisfaction: 0,
          practiceDetails: "")
      .obs;

  loadTherapistDetails(therapistID) {
    therapist.value = TherapistEntity(
      email: "aikomali@gmail",
      bio:
          "Seasoned mental health counsellor with 18 years of experience working with people who have diverse needs. Knowledgeable in behavioral monitoring, psychological testing, research methods, rehabilitation techniques, and psychometrics. Strength in performing diagnostic testing and delivering appropriate therapies. Proven track record of effective results and positive outcomes with clients. Compassionate, understanding, and friendly demeanor when working with challenging clients in any situation.",
      fullName: "Aiko Mali",
      specialty: "Cognitive Behavioural Therapy",
      availabilityStatus: true,
      price: 90,
      review: 99,
      totalScore: 94,
      satisfaction: 93,
      practiceDetails: "Medhelp Mental Clinic, 66- 30100, Eldoret, Kenya",
    );
  }

  populateDoctors() {
    var doctor = TherapistEntity();
    doctor.fullName = "Dr Strange";
    doctor.email = "doctorstrange@gmail.com";
    doctor.category = "Behavioural";
    therapistRef.add(doctor);

    doctor = TherapistEntity();
    doctor.fullName = "Test doctor";
    doctor.email = "testdoctor@gmail.com";
    doctor.category = "Addiction";
    therapistRef.add(doctor);
  }

  getStories() {
    stories.bindStream(storyModelRef
        .orderByExpiry(descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));
  }

  getArticleCategories() {
    articleCategories.bindStream(articleCategoryRef
        .orderByViews(descending: true)
        .limit(5)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));
  }

  void watchStories() {
    userStories.bindStream(stories.stream.map((story) {
      return mapUserStory(story);
    }));
  }

  List<UserStory> mapUserStory(List<StoryModel> storyList) {
    return groupBy(storyList, (StoryModel e) {
      return e.owner;
    }).entries.map((e) {
      return UserStory(
        stories: e.value,
        owner: e.key,
        user: e.value.first.user,
      );
    }).toList();
  }

  getConsultants() {
    doctors.bindStream(therapistRef
        .orderByReview(descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));
  }

  var upcomingAppointments = <AppointmentModel>[].obs;

  void loadUpcomingAppointments() {
    upcomingAppointments.bindStream(appRef
        .orderByAppointmentDate(descending: true)
        .wherePatientEmail(isEqualTo: SessionUtils.getMail()!)
        .whereCompleted(isEqualTo: false)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));
  }

  createStory() {
    StoryModel model = StoryModel(
        url: "",
        media: MediaType.image,
        duration: Duration(),
        user: "Test ${6}",
        expiry: DateTime.now().millisecondsSinceEpoch,
        owner: "philmaxsnr@gmail.com");
    storyModelRef.add(model);
  }

  createCategory() {
    var category = ArticleCategoryEntity();
    category.title = "Addiction";
    category.subtitle = "Manage and overcome addictions";
    category.views = 0;
    articleCategoryRef.add(category);
  }
}
