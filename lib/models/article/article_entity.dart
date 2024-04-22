import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'article_entity.g.dart';


class Post {
  Post({
    required this.postId,
    required this.title,
    required this.text,
    required this.createdAt,
    required this.ownerId,
    required this.mood,
    required this.image,
    required this.authorName,
    required this.avatar,
  });
  late final String title;
  late final String postId;
  late final String text;
  late final String createdAt;
  late final String ownerId;
  late final String mood;
  late final String image;
  late final String authorName;
  late final String avatar;

  Post.fromJson(Map<String, dynamic> json){
    title = json['title'];
    text = json['text'];
    createdAt = json['createdAt'];
    ownerId = json['ownerId'];
    postId = json['postId'];
    authorName = json['authorName'];
    avatar = json['avatar'];
    mood = json['mood'];image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['text'] = text;
    _data['createdAt'] = createdAt;
    _data['ownerId'] = ownerId;
    _data['postId'] = postId;
    _data['authorName'] = authorName;
    _data['avatar'] = avatar;
    _data['mood'] = mood; _data['image'] = image;
    return _data;
  }
}

@Collection<Post>('articles')
final articleCategory =PostCollectionReference();