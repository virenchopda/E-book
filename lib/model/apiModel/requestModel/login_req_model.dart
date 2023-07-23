// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals, file_names

class LoginReqModel {
  String? email;
  String? password;
  String? deviceId;

  LoginReqModel({this.email, this.password, this.deviceId});

  LoginReqModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['device_id'] = this.deviceId;
    return data;
  }
}
