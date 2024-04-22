import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/article/article_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../shared/constants/colors.dart';

class PostDetailScreenController extends GetxController {
  RxString username = "".obs;
  String postId = "";


  var currentPost = Post(
      title: "",
      text: "",
      ownerId: "",
      createdAt: "",
      mood: "",
      image: "",
      postId: "",
      avatar: '',
      authorName: '')
      .obs;
  var posts = <Post>[].obs;
  String message = "Don’t keep it to  yourself, talk to a professional!";
  var scrollOffset =1.obs;
  String testImage =
      "https://s3-alpha-sig.figma.com/img/062a/6555/e14fe9428130facd636ba543361168e3?Expires=1635724800&Signature=QFgewaRgvrgflAHWG5SpQznKGnJoSuuvBX4fz3ofjFC2Smv0DDwDnnduus32Bs8iWqxEsQAMWq-hEUTKKcz0Rc~KFK7UKJXGFEoYlB3KHkiF0XT0P~b55IW7p8E1a-IpF15tYumK7qwbssEQSjZhBoXPybn-skeR~1GPyXjVRD403ZOYLfbkjwDlAGkAk25EfYFA0~jHVnJP6CRhhVjd2OJe3ss6vS-Bmn3eyq7NpxD3Uj9vDGRC-z65db5q3QKPDpzlrKk~2uijvfFO7fjtTkVMml3UlAuHDBoDYSuZhSzzS9kqjeB6~7m~ja09qdO9z0wJbqKpFTGXTg88votMMQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";

  PostDetailScreenController(String postId) {
    this.postId = postId;
  }



  @override
  void onInit() {
    getSinglePost(postId);
    super.onInit();
  }

  void addBookMark(String postId){
    CollectionReference reference =
    FirebaseFirestore.instance.collection('bookmarks');
    Map<String, Object> postdata = {
      "postId":postId,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "email": SessionUtils.getMail()!,
    };

    reference.add(postdata).then((value) {
      Get.snackbar("Saved", "Article saved to bookmarks",
          backgroundColor: Cc.kPrimaryColor, colorText: Colors.white);
    });
  }


  Future<Post> getPost(Map map, String id) async {
    String title = map['title'];
    String text = map['text'];
    int createdAt = map['createdAt'];
    String mood = map['mood'];
    String image = map['image'];
    String owner = map['owner'];
    
    
    var user = await getUserProfile(owner);
    var avatar = " ";
    if(user!.containsKey('imageUrl')){
      avatar = user['imageUrl'];
    }
    
    var duration =
    timeago.format(DateTime.fromMillisecondsSinceEpoch(createdAt));
    return Post(
        title: title,
        text: text,
        ownerId: owner,
        createdAt: duration,
        image: image,
        postId: id,
        mood: mood,
        avatar: avatar,
        authorName: user['fullname']);
  }

  Future<void> getSinglePost(postId) async {
    print("Fetching single post");

    CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('feed');

    QuerySnapshot querySnapshot =
    await collectionRef.where( FieldPath.documentId, isEqualTo: postId).get();
    final allData = querySnapshot.docs.map((doc) => doc).toList();

    print("Trying to get single post");
    print(allData.length);

    if(allData.length>0){
      var element = allData.first;
      var data = element.data() as Map<String, dynamic>;
      currentPost.value = await getPost(data, element.id);
    }
  }

  Future<Map<String, dynamic>?> getUserProfile(String email) async {
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot =
    await _collectionRef.where('email', isEqualTo: email).get();
    final allData = querySnapshot.docs
        .map((doc) => doc.data())
        .toList();
    if (allData.isEmpty) {
      return null;
    } else {
      return allData.first as Map<String, dynamic>;
    }
  }


}
