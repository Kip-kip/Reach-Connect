import 'dart:io';

import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:bridgme/app/shared/constants/storage.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/article/article_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../models/user/user_model_entity.dart';

class ArticleController extends GetxController {
  String categoryId;
  ArticleController(this.categoryId);

  @override
  void onReady() {
    super.onReady();
    getPosts(categoryId);
  }


  var post = Post(
      title: "",
      text: "",
      createdAt: "",
      ownerId: "",
      mood: "",
      image: "",
      postId: "",
      authorName: '',
      avatar: '');
  final titleController = TextEditingController();
  final textController = TextEditingController();

  var posts = <Post>[].obs;
  var currentPost = Post(
          title: "",
          text: "",
          ownerId: "",
          createdAt: "",
          mood: "",
          image: "",
          postId: "",
          authorName: '',
          avatar: '')
      .obs;
  RxString mood = "General".obs;
  RxString medialType = "Image".obs;

  RxString category = "Fine".obs;
  final mediaTypes = ["Video", "Image"];
  final moods = [
    "Depression",
    "Anxiety",
    "Religion",
    "Mental Health",
    "Self Harm",
    "Love",
    "Education",
    "Parenting",
    "LGBT",
    "Bullying",
    "Pregnancy",
    "Addiction",
    "Work",
    "New Parents",
    "Eating Disorders",
    "Relationship",
    "Grief",
    "Hopes",
    "Positivity",
    "Family",
    "Disablity",
    "Alcoholism",
    "Bipolar",
    "Paranoia",
    "Psychosis",
    "Mood swings"
  ];

  final categories = ["Happy", "Sad", "Fine", "Well", "Angry"];

  var loadingStatus = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void createPost(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("feed");
    var prefs = Get.find<SharedPreferences>();
    var username = prefs.getString(StorageConstants.username);
    var email = prefs.getString(StorageConstants.userEmail);

    if (textController.text.isEmpty || titleController.text.isEmpty) {
      Get.snackbar("Information", "Title and article content are required",
          backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
      return;
    }
    if (postImage.isEmpty) {
      Get.snackbar("Required", "Article image is required",
          backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
      return;
    }

    Map<String, Object> postdata = {
      "title": titleController.text,
      "text": textController.text,
      "owner": email!,
      "mood": mood.value,
      "category": category.value,
      "author": username!,
      "image": postImage.value,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "verified": false,
    };

    reference.add(postdata).then((value) {
      mood.value = "";
      textController.clear();
      titleController.clear();
      postImage.value = "";

      Get.snackbar("Saved", "Article successfully saved to the chat room",
          backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
    });
  }

  void createStatus(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("status");
    var prefs = Get.find<SharedPreferences>();
    var username = prefs.getString(StorageConstants.username);
    var email = prefs.getString(StorageConstants.userEmail);
    var dp = prefs.getString(StorageConstants.displayPicture);

    if (postImage.isEmpty) {
      Get.snackbar("Required", "status media is required",
          backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
      return;
    }

    Map<String, Object> postdata = {
      "text": textController.text,
      "email": email!,
      "avatar": dp ?? "",
      "type": medialType.value,
      "isOnline": false,
      "url": [
        {
          "text": textController.text,
          "link": postImage.value,
          "type": medialType.value
        }
      ],
      "date": DateTime.now().millisecondsSinceEpoch,
    };

    reference.add(postdata).then((value) {
      mood.value = "";
      textController.clear();
      titleController.clear();
      postImage.value = "";

      Get.snackbar("Saved", "Status successfully saved to the chat room",
          backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
    });
  }

  FirebaseStorage _storage = FirebaseStorage.instance;
  var profile = "".obs;
  var postImage = "".obs;

  void uploadPic() async {
    final picker = ImagePicker();
    XFile? pickedFile;
    if (medialType.value == "Image") {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
      SessionUtils.toast(pickedFile!.mimeType!, pickedFile.mimeType!);
    } else {
      pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    }

    File? file;
    if (medialType.value == "Image") {
      file = await ImageCropper().cropImage(
          sourcePath: pickedFile!.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          compressQuality: 60,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Cc.kPrimaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
    } else {
      if (pickedFile != null) file = File(pickedFile.path);
    }

    if (file != null) {
      var reference = _storage.ref().child("tulivu/");
      var snap = await reference.putFile(file);
      var image = await snap.ref.getDownloadURL();
      postImage.value = image;
    }
  }

  Post getPost(Map map, String id) {
    String title = map['title'];
    String text = map['text'];
    int createdAt = map['createdAt'];
    String mood = map['mood'];
    String image = map['image'];
    var duration =
        timeago.format(DateTime.fromMillisecondsSinceEpoch(createdAt));
    return Post(
        title: title,
        text: text,
        ownerId: title,
        createdAt: duration,
        image: image,
        postId: id,
        mood: mood,
        avatar: '',
        authorName: '');
  }

  readingTime(String text) {
    var wpm = 80;
    var words = text.split(' ').length;

    var read = words ~/ wpm;
    if (read < 1) {
      return 1;
    }

    return read;
  }

  getPosts(String categoryId) async {
    return loadDummyPosts();
    var databaseReference = FirebaseFirestore.instance;
    posts.clear();
    var collection = databaseReference.collection("feed");
    if (categoryId.isNotEmpty) {
      collection
          .where('category', isEqualTo: categoryId)
          .snapshots()
          .listen((data) {
        posts.clear();
        data.docs.forEach((change) {
          Map data = change.data();
          posts.add(getPost(data, change.id));
        });
      });
    } else {
      collection.snapshots().listen((data) {
        posts.clear();
        data.docs.forEach((change) {
          Map data = change.data();
          posts.add(getPost(data, change.id));
        });
      });
    }
  }
// getData();]]

  loadDummyPosts(){
    posts.value = [Post(
      title:"Benefits of therapy",
      postId:"39734",
      text:"The counseling process is, in many ways, is like an educational experience. The individual can learn more about him/herself, but also acquires new skills. Sometimes, counseling involves learning more about a particular condition (e.g., depression, anxiety, eating disorders) by which the person is affected, so that he/she can better understand treatment options. Below are some examples of what students can gain from personal counseling:",
      createdAt:"1656312867",
      ownerId:"99",
      mood:"Happy",
      image:"https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/10/Couple_Therapy_1296x728-header-1296x729.jpg",
      authorName: "Anonymous P",
      avatar: "",
    ),
      Post(
        title:"Benefits of therapy",
        postId:"39734",
        text:"The counseling process is, in many ways, is like an educational experience. The individual can learn more about him/herself, but also acquires new skills. Sometimes, counseling involves learning more about a particular condition (e.g., depression, anxiety, eating disorders) by which the person is affected, so that he/she can better understand treatment options. Below are some examples of what students can gain from personal counseling:",
        createdAt:"1656312867",
        ownerId:"99",
        mood:"Happy",
        image:"https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/10/Couple_Therapy_1296x728-header-1296x729.jpg",
        authorName: "Anonymous P",
        avatar: "",
      ),
      Post(
        title:"Benefits of therapy",
        postId:"39734",
        text:"The counseling process is, in many ways, is like an educational experience. The individual can learn more about him/herself, but also acquires new skills. Sometimes, counseling involves learning more about a particular condition (e.g., depression, anxiety, eating disorders) by which the person is affected, so that he/she can better understand treatment options. Below are some examples of what students can gain from personal counseling:",
        createdAt:"1656312867",
        ownerId:"99",
        mood:"Happy",
        image:"https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/10/Couple_Therapy_1296x728-header-1296x729.jpg",
        authorName: "Anonymous P",
        avatar: "",
      ),
      Post(
        title:"Benefits of therapy",
        postId:"39734",
        text:"The counseling process is, in many ways, is like an educational experience. The individual can learn more about him/herself, but also acquires new skills. Sometimes, counseling involves learning more about a particular condition (e.g., depression, anxiety, eating disorders) by which the person is affected, so that he/she can better understand treatment options. Below are some examples of what students can gain from personal counseling:",
        createdAt:"1656312867",
        ownerId:"99",
        mood:"Happy",
        image:"https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/10/Couple_Therapy_1296x728-header-1296x729.jpg",
        authorName: "Anonymous P",
        avatar: "",
      ),];
  }
}
