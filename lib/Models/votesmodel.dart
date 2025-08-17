class VotesModel {
  bool? success;
  String? message;
  List<FinaluservoteList>? finaluservoteList;

  VotesModel({this.success, this.message, this.finaluservoteList});

  VotesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['finaluservoteList'] != null) {
      finaluservoteList = <FinaluservoteList>[];
      json['finaluservoteList'].forEach((v) {
        finaluservoteList!.add(new FinaluservoteList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.finaluservoteList != null) {
      data['finaluservoteList'] =
          this.finaluservoteList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FinaluservoteList {
  Id? id;
  int? voteCount;
  String? role;

  FinaluservoteList({this.id, this.voteCount, this.role});

  FinaluservoteList.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    voteCount = json['voteCount'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id!.toJson();
    }
    data['voteCount'] = this.voteCount;
    data['role'] = this.role;
    return data;
  }
}

class Id {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? createdAt;
  int? iV;

  Id({this.sId, this.name, this.email, this.password, this.createdAt, this.iV});

  Id.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
