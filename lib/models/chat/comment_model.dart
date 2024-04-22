class CommentModel {
  CommentModel({
    required this.postId,
    required this.likes,
    required this.text,
    required this.author,
    required this.authorName,
    required this.authorAvatar,
    required this.time,
    required this.userLikes,
  });
  late final String postId;
  late  int likes;
  late final String text;
  late final String author;
  late final String authorName;
  late final String authorAvatar;
  late final int time;
  String docId="";
  bool isTherapist=false;
  late  List<String> userLikes;

  CommentModel.fromJson(Map<String, dynamic> json){
    postId = json['postId'] as String;
    docId = json['docId'] ;
    likes = json['likes'];
    text = json['text'];
    author = json['author'];
    authorName = json['authorName'];
    authorAvatar = json['authorAvatar'];
    time = json['time'];
    if(json.containsKey('isTherapist')){
      isTherapist = json['isTherapist'];
    }
    userLikes = List.castFrom<dynamic, String>(json['userLikes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['postId'] = postId;
    _data['likes'] = likes;
    _data['text'] = text;
    _data['author'] = author;
    _data['authorName'] = authorName;
    _data['authorAvatar'] = authorAvatar;
    _data['time'] = time;
    _data['userLikes'] = userLikes;
    _data['docId']= docId;
    _data['isTherapist']=isTherapist;
    return _data;
  }
}