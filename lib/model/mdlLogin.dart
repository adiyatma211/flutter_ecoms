class getLogin {
  bool? success;
  String? message;
  Data? data;

  getLogin({this.success, this.message, this.data});

  getLogin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  String? name;
  int? id;

  Data({this.token, this.name, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
