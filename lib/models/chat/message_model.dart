class MessageModel {
  MessageModel({
    required this.dialog ,
    required this.from,
    required this.time,
    required this.to,
    required this.text,
  });
  late final String dialog ;
  late final String from;
  late final int time;
  late final String to;
  late final String text;

  MessageModel.fromJson(Map<String, dynamic> json){
    dialog  = json['dialog'];
    from = json['from'];
    time = json['time'];
    to = json['to'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dialog'] = dialog ;
    _data['from'] = from;
    _data['time'] = time;
    _data['to'] = to;
    _data['text'] = text;
    return _data;
  }
}