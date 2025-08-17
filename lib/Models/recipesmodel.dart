class Recipes2 {
  bool? success;
  String? message;
  List<Data>? data;

  Recipes2({this.success, this.message, this.data});

  Recipes2.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? createdBy;
  String? createdAt;
  int? iV;

  Data({this.sId, this.name, this.createdBy, this.createdAt, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
