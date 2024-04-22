class Avatar {
  String? id;
  String? originalname;
  String? encoding;
  String? mimetype;
  String? destination;
  String? filename;
  String? path;
  int?  size;
  int?  width;
  int?  height;
  String? type;
  String? createdAt;
  String? updatedAt;
  int?  v;

  Avatar({
      this.id, 
      this.originalname, 
      this.encoding, 
      this.mimetype, 
      this.destination, 
      this.filename, 
      this.path, 
      this.size, 
      this.width, 
      this.height, 
      this.type, 
      this.createdAt, 
      this.updatedAt, 
      this.v});

  Avatar.fromJson(dynamic json) {
    id = json["_id"];
    originalname = json["originalname"];
    encoding = json["encoding"];
    mimetype = json["mimetype"];
    destination = json["destination"];
    filename = json["filename"];
    path = json["path"];
    size = json["size"];
    width = json["width"];
    height = json["height"];
    type = json["type"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    map["originalname"] = originalname;
    map["encoding"] = encoding;
    map["mimetype"] = mimetype;
    map["destination"] = destination;
    map["filename"] = filename;
    map["path"] = path;
    map["size"] = size;
    map["width"] = width;
    map["height"] = height;
    map["type"] = type;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

}