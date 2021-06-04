import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/UI/animation/FadeAnimation.dart';
import 'package:flutter_finpro_mobile/UI/launch.dart';
import 'package:flutter_finpro_mobile/auth/sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; //
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //background
            Container(
              height: 400,
              child: Stack(
                //menunmpuk gambar background dan background-2
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/background.png'),
                                  fit: BoxFit.fill)),
                        )),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/background-2.png'),
                                  fit: BoxFit.fill)),
                        )),
                  )
                ],
              ),
            ),

            //teks
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            fontFamily: 'Nunito'),
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            color: Color.fromRGBO(196, 135, 198, 1),
                            fontSize: 17,
                            fontFamily: 'Nunito'),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  //username dan password
                  FadeAnimation(
                      1.7,
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(196, 135, 198, .3),
                                  blurRadius: 3,
                                  offset: Offset(3, 3),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextField(
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.account_circle,
                                        size: 20,
                                        color: Color.fromRGBO(49, 39, 79, 1),
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Nunito',
                                          fontSize: 15)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.lock,
                                        size: 20,
                                        color: Color.fromRGBO(49, 39, 79, 1),
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Nunito',
                                          fontSize: 15)),
                                  obscureText:
                                      true, // agar teks yang diinput berubah jadi simbol *
                                ),
                              ),
                            ],
                          ))),
                  SizedBox(
                    height: 25,
                  ),
                  // forgot password
                  FadeAnimation(
                    1.7,
                    Center(
                        child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          color: Color.fromRGBO(196, 135, 198, 1),
                          fontFamily: 'Nunito',
                          fontSize: 12),
                    )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //button login
                  FadeAnimation(
                      1.9,
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(49, 39, 79, 1),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Nunito'),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  //sign up / register
                  FadeAnimation(
                      2,
                      Center(
                          child: Text(
                        "--- Sign in with ---",
                        style: TextStyle(
                            color: Color.fromRGBO(196, 135, 198, 1),
                            fontFamily: 'Nunito',
                            fontSize: 13),
                      ))),
                  SizedBox(
                    height: 20,
                  ),
                  //button google
                  FadeAnimation(
                      2.3,
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 98),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(49, 39, 79, 1),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _signInButton(),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    // ignore: deprecated_member_use
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NavigationDrawer();
                },
              ),
            );
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google.png"), height: 20.0),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: Text(
            //     'Google',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: 'Nunito'
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

// Container(
//   color: Colors.white,
//   child: Center(
//     child: Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         FlutterLogo(size: 150),
//         SizedBox(height: 50),
//         _signInButton(),
//       ],
//     ),
//   ),
// ),
