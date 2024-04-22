import 'package:bridgme/app/shared/utils/session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Create_chatLogic extends GetxController {
  var loadingValue = 0.obs;
  final moodController = TextEditingController();
  final textController = TextEditingController();
  final nameController = TextEditingController();
  RxString mood = "Positivity".obs;
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
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createPost(BuildContext context) {
    loadingValue.value = 1;
    CollectionReference reference =
    FirebaseFirestore.instance.collection("chatroom");

    var author = nameController.text;
    if (textController.text.isEmpty) {
      SessionUtils.info("Information", "Please type some content");
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
      SessionUtils.info("Saved", "Post successfully saved to the chat room");
    });
  }

}
