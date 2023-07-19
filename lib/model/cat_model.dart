import 'package:hive/hive.dart';

part 'cat_model.g.dart';
@HiveType(typeId: 0)
class CatModel {
  @HiveField(1)
  Status? status;
  @HiveField(2)
  String? sId;
  @HiveField(3)
  String? user;
  @HiveField(4)
  String? text;
  @HiveField(5)
  String? type;
  @HiveField(6)
  bool? deleted;
  @HiveField(7)
  String? createdAt;
  @HiveField(8)
  String? updatedAt;
  @HiveField(9)
  int? iV;

  CatModel(
      {this.status,
      this.sId,
      this.user,
      this.text,
      this.type,
      this.deleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    sId = json['_id'];
    user = json['user'];
    text = json['text'];
    type = json['type'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = this.status!.toJson();
    }
    data['_id'] = sId;
    data['user'] = user;
    data['text'] = text;
    data['type'] = type;
    data['deleted'] = deleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

@HiveType(typeId: 1)
class Status {
  @HiveField(2)
  bool? verified;
  @HiveField(3)
  int? sentCount;

  Status({this.verified, this.sentCount});

  Status.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    sentCount = json['sentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['verified'] = verified ?? false;
    data['sentCount'] = sentCount;
    return data;
  }
}
