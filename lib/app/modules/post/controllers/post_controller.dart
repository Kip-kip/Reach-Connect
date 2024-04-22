import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/article/article_entity.dart';
import 'package:bridgme/models/user/user_model_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/constants/colors.dart';

class PostScreenController extends GetxController {
  var dummyText =
      """ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor orcivitae lorem scelerisque, eu finibus neque luctus. Curabitur commodo
vulputate neque eu consectetur. Nullam commodo augue nec sem 
rutrum consectetur. Curabitur tellus erat, consequat non erat vel, feugiat
dapibus sapien. Nulla a nisi est. Aenean sed egestas tellus. Pellentesque
efficitur risus sit amet metus venenatis, at ultricies sapien pellentesque. 
Etiam scelerisque erat imperdiet nulla hendrerit finibus.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor orci
vitae lorem scelerisque, eu finibus neque luctus. Curabitur commodo
vulputate neque eu consectetur. Nullam commodo augue nec sem 
rutrum consectetur. Curabitur tellus erat, consequat non erat

""";


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
  final moodController = TextEditingController();
  final textController = TextEditingController();
  final nameController = TextEditingController();
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
  RxString mood = "Positivity".obs;
  var loadingValue = 0.obs;

  void navigateToReset() {}

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  Post getPost(Map map, id) {
    String title = '';
    if (map.containsKey('title')) {
      title = map['title'];
    } else if (map.containsKey('owner')) {
      title = map['owner'];
    }

    String text = map['text'];
    int createdAt = map['createdAt'];
    String mood = map['mood'];
    return Post(
        title: title,
        text: text,
        ownerId: title,
        createdAt: "",
        mood: mood,
        image: "",
        postId: id,
        authorName: '',
        avatar: '');
  }

  getPosts() async {
    // var databaseReference = FirebaseFirestore.instance;
    //   databaseReference
    //       .collection("posts")
    //       .snapshots()
    //       .listen((data) {
    //     data.docs.forEach((change) {
    //
    //       Map data = change.data();
    //       posts.add(getPost(data));
    //     });
    //   });

    getData();
  }

  Future<void> getData() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('chatroom');
    QuerySnapshot querySnapshot = await _collectionRef.get();

    final allData = querySnapshot.docs.map((doc) => doc).toList();
    allData.forEach((element) {
      Map data = element.data() as Map;
      currentPost.value = getPost(data, element.id);
    });
  }

  void createPost(BuildContext context) {
    loadingValue.value = 1;
    CollectionReference reference =
        FirebaseFirestore.instance.collection("chatroom");
    var prefs = Get.find<SharedPreferences>();

    var author = nameController.text;
    if (textController.text.isEmpty) {
      Get.snackbar("Information", "Please type some content",
          backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
      return;
    }

    if (author.isEmpty) {
      author = "Anonymous";
    }

    if (mood.isEmpty) {
      mood.value = "General";
    }

    Map<String, Object> postdata = {
      "mood": mood.value,
      "text": textController.text,
      "owner": SessionUtils.getMail()!,
      "author": author,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "verified": false,
      "comments": [],
    };

    reference.add(postdata).then((value) {
      mood.value = "";
      textController.clear();
      nameController.clear();
      loadingValue.value = 0;

      Get.snackbar("Saved", "Post successfully saved to the chat room",
          backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
    });
  }

  Future<Map<String, dynamic>?> getUserProfile(String email) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot =
        await _collectionRef.where('email', isEqualTo: email).get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    if (allData.isEmpty) {
      return null;
    } else {
      return allData.first as Map<String, dynamic>;
    }
  }

  var profile = "".obs;
}
