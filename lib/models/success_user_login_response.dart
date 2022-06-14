import 'package:order_tracking/models/user.dart';

class SuccessUserLoginResponse {
  String? token;
  String? loginAttemptDate;
  User? user;

  SuccessUserLoginResponse({this.token, this.loginAttemptDate, this.user});

  SuccessUserLoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    loginAttemptDate = json['loginAttemptDate'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['loginAttemptDate'] = loginAttemptDate;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}


