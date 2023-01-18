

// ignore_for_file: prefer_collection_literals, duplicate_ignore, unnecessary_this, unnecessary_new, unnecessary_question_mark

class Note {
  int? id;
  String? userid;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  // ignore: prefer_void_to_null
  Null? deletedAt;

  Note(
      {this.id,
      this.userid,
      this.title,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Note.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toApp() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['id'] = this.id;
    // ignore: unnecessary_this
    data['userid'] = this.userid;
    // ignore: unnecessary_this
    data['title'] = this.title;
    // ignore: unnecessary_this
    data['content'] = this.content;
    // ignore: unnecessary_this
    data['created_at'] = this.createdAt;
    // ignore: unnecessary_this
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
  Map<String, dynamic> toCreate() {
    // ignore: unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['userid'] = this.userid;
    // ignore: unnecessary_this
    data['title'] = this.title;
    // ignore: unnecessary_this
    data['content'] = this.content;
    return data;
  }
  // ignore: duplicate_ignore
  Map<String, dynamic> toUpdate() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['id'] = this.id;
    // ignore: unnecessary_this
    data['title'] = this.title;
    // ignore: unnecessary_this
    data['content'] = this.content;
    return data;
  }
  
}
