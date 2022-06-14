
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {
  signUp(String mail, String password) async {
    http.Response response = await http.post(
      Uri.parse("localhost:8080/api/v1/users/sign-up"),
      body: {"email": mail, "password": password},
    );

    if (response.statusCode == 201) {
      print(response.body);
    } else {
      return [
        false,
        "İşleminizi gerçekleştiremiyoruz. Lütfen daha sonra tekrar deneyiniz."
      ];
    }
  }

  void signIn(BuildContext context, String mail, String password) async {
    print("istek yapiliyor.....");
    var response = await http.post(
      Uri.parse("localhost:8080/api/v1/users/sign-in"),
      body: {"email": mail, "password": password},
    );

    print("istek yapildi");
    print(response.statusCode);

    // if (response.statusCode == 200) {
    //   // Map myBody = jsonDecode(response.body);
    //   // buildSnackBar(context, myBody["token"]);
    //   print("giris islemi basarili");
    // } else {
    //   // buildSnackBar(context, "İşleminizi gerçekleştiremiyoruz. Lütfen daha sonra tekrar deneyiniz.");
    //   print("giris islemi BASARISIZ");
    // }
  }
}
