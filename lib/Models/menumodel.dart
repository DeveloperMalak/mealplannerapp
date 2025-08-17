class Foodschedule {
  bool? success;
  String? message;
  List<Menu>? menu;

  Foodschedule({this.success, this.message, this.menu});

  Foodschedule.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(new Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  Days? days;
  String? sId;
  String? editedBy;
  String? editedAt;
  int? iV;

  Menu({this.days, this.sId, this.editedBy, this.editedAt, this.iV});

  Menu.fromJson(Map<String, dynamic> json) {
    days = json['days'] != null ? new Days.fromJson(json['days']) : null;
    sId = json['_id'];
    editedBy = json['edited_by'];
    editedAt = json['edited_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.days != null) {
      data['days'] = this.days!.toJson();
    }
    data['_id'] = this.sId;
    data['edited_by'] = this.editedBy;
    data['edited_at'] = this.editedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Days {
  Monday? monday;
  Monday? tuesday;
  Monday? wednesday;
  Monday? thursday;
  Monday? friday;
  Monday? saturday;
  Monday? sunday;

  Days({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  Days.fromJson(Map<String, dynamic> json) {
    monday =
        json['monday'] != null ? new Monday.fromJson(json['monday']) : null;
    tuesday =
        json['tuesday'] != null ? new Monday.fromJson(json['tuesday']) : null;
    wednesday =
        json['wednesday'] != null
            ? new Monday.fromJson(json['wednesday'])
            : null;
    thursday =
        json['thursday'] != null ? new Monday.fromJson(json['thursday']) : null;
    friday =
        json['friday'] != null ? new Monday.fromJson(json['friday']) : null;
    saturday =
        json['saturday'] != null ? new Monday.fromJson(json['saturday']) : null;
    sunday =
        json['sunday'] != null ? new Monday.fromJson(json['sunday']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.monday != null) {
      data['monday'] = this.monday!.toJson();
    }
    if (this.tuesday != null) {
      data['tuesday'] = this.tuesday!.toJson();
    }
    if (this.wednesday != null) {
      data['wednesday'] = this.wednesday!.toJson();
    }
    if (this.thursday != null) {
      data['thursday'] = this.thursday!.toJson();
    }
    if (this.friday != null) {
      data['friday'] = this.friday!.toJson();
    }
    if (this.saturday != null) {
      data['saturday'] = this.saturday!.toJson();
    }
    if (this.sunday != null) {
      data['sunday'] = this.sunday!.toJson();
    }
    return data;
  }
}

class Monday {
  Breakfast? breakfast;
  Breakfast? lunch;
  Breakfast? dinner;

  Monday({this.breakfast, this.lunch, this.dinner});

  Monday.fromJson(Map<String, dynamic> json) {
    breakfast =
        json['breakfast'] != null
            ? new Breakfast.fromJson(json['breakfast'])
            : null;
    lunch =
        json['lunch'] != null ? new Breakfast.fromJson(json['lunch']) : null;
    dinner =
        json['dinner'] != null ? new Breakfast.fromJson(json['dinner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breakfast != null) {
      data['breakfast'] = this.breakfast!.toJson();
    }
    if (this.lunch != null) {
      data['lunch'] = this.lunch!.toJson();
    }
    if (this.dinner != null) {
      data['dinner'] = this.dinner!.toJson();
    }
    return data;
  }
}

class Breakfast {
  Mealid? mealid;
  String? time;
  String? sId;

  Breakfast({this.mealid, this.time, this.sId});

  Breakfast.fromJson(Map<String, dynamic> json) {
    mealid =
        json['mealid'] != null ? new Mealid.fromJson(json['mealid']) : null;
    time = json['time'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mealid != null) {
      data['mealid'] = this.mealid!.toJson();
    }
    data['time'] = this.time;
    data['_id'] = this.sId;
    return data;
  }
}

class Mealid {
  String? sId;
  String? name;
  String? createdBy;
  String? createdAt;
  int? iV;

  Mealid({this.sId, this.name, this.createdBy, this.createdAt, this.iV});

  Mealid.fromJson(Map<String, dynamic> json) {
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
