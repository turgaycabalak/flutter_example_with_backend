import 'package:flutter/material.dart';
import 'package:order_tracking/constants/background_color.dart';
import 'package:order_tracking/constants/theme.dart';
import 'package:order_tracking/service/user_service.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  MyTheme myTheme = MyTheme();
  UserService userService = UserService();
  String myMail = "";
  String myPassword = "";
  bool passwordHiding = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: MyBackGroundColor(backGroundColor),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 180,
                  height: 180,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      )),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: MyBackGroundColor("2D2F3A"),
                          width: 15,
                        )),
                    child: Icon(
                      Icons.login_outlined,
                      size: 45,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 15),
                  child: Text(
                    "Giriş Yapın",
                    // style: GoogleFonts.quicksand(
                    //   color: Colors.white,
                    //   fontSize: 30,
                    // ),
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                // e-posta form input
                Container(
                  decoration: myTheme.myInputBoxDecoration(),
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, right: 30, left: 30),
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: TextFormField(
                    onChanged: (value) => myMail = value,
                    decoration: myTheme.myInputDecoration(
                        hintText: "E-posta adresinizi giriniz",
                        iconData: Icons.person_outline),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 17),
                  ),
                ),
                // password form input
                Container(
                  decoration: myTheme.myInputBoxDecoration(),
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, right: 30, left: 30),
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) => myPassword = value,
                          obscureText: passwordHiding,
                          decoration: myTheme.myInputDecoration(
                              hintText: "Parolanızı giriniz",
                              iconData: Icons.key_outlined),
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    fontSize: 17,
                                    // letterSpacing: 5
                                  ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              passwordHiding = !passwordHiding;
                            });
                          },
                          icon: Icon(
                            passwordHiding ? Icons.remove_red_eye : Icons.close,
                            color: MyBackGroundColor("7F8C99"),
                          ))
                    ],
                  ),
                ),
                // sign in button -> InkWell = içine koydugumuz widget a tiklanabilirilik ozelligi getirir
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: InkWell(
                    onTap: () {
                      if (myMail.length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackBar(
                              context, "E-mail 3 karakterden küçük olamaz!"),
                        );
                      } else if (!myMail.contains("@")) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackBar(context, "E-mail formatı uygun değil!"),
                        );
                      } else if (myPassword.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackBar(
                              context, "Parola 6 karakterden küçük olamaz!"),
                        );
                      } else {
                        userService.signIn(context, myMail, myPassword);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 9,
                      padding: EdgeInsets.all(10),
                      // margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: MyBackGroundColor("2D2F3A"),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(-5, 7))
                        ],
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [
                            MyBackGroundColor("224ABE"),
                            MyBackGroundColor("4E73DF"),
                          ],
                          // renk akışı sağ-üst den sol-alt a doğru olur
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Giriş Yap",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
