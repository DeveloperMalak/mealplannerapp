class AllUsersModel {
  bool? success;
  String? message;
  List<Allusers>? allusers;

  AllUsersModel({this.success, this.message, this.allusers});

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['allusers'] != null) {
      allusers = <Allusers>[];
      json['allusers'].forEach((v) {
        allusers!.add(new Allusers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.allusers != null) {
      data['allusers'] = this.allusers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allusers {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? createdAt;
  int? iV;

  Allusers({
    this.sId,
    this.name,
    this.email,
    this.password,
    this.createdAt,
    this.iV,
  });

  Allusers.fromJson(Map<String, dynamic> json) {
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
