import 'package:get/get.dart';

import '../../../../../../../models/article/article_entity.dart';


class JournalsDetailsLogic extends GetxController {
  String postId;
  JournalsDetailsLogic(this.postId);

  @override
  void onReady() {
    super.onReady();
    loadArticle(postId);
  }

  var article =  Post(
    title:"",
    postId:"",
    text:"",
    createdAt:"",
    ownerId:"",
    mood:"",
    image:"",
    authorName: "",
    avatar: "",
  ).obs;
  void loadArticle(postId){
    article.value = Post(
      title:"Benefits of therapy",
      postId:"39734",
      text:"The counseling process is, in many ways, is like an educational experience. The individual can learn more about him/herself, but also acquires new skills. Sometimes, counseling involves learning more about a particular condition (e.g., depression, anxiety, eating disorders) by which the person is affected, so that he/she can better understand treatment options. Below are some examples of what students can gain from personal counseling:",
      createdAt:"1656312867",
      ownerId:"99",
      mood:"Happy",
      image:"",
      authorName: "Anonymous P",
      avatar: "",
    );
  }

}
