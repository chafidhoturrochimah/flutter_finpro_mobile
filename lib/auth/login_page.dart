import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/UI/animation/FadeAnimation.dart';
import 'package:flutter_finpro_mobile/UI/dashboard.dart';
import 'package:flutter_finpro_mobile/UI/welcome_animation.dart';
import 'package:flutter_finpro_mobile/auth/sign_in.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var auth = new Auth();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //tambahkan form untuk validasi form
  final _formKey = GlobalKey<FormState>();

  //untuk hidepassword icon
  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

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
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.account_circle,
                                      size: 20,
                                      color: Color.fromRGBO(49, 39, 79, 1),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Nunito',
                                        fontSize: 15),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter an Email Address';
                                    } else if (!value.contains('@')) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: _isHidePassword,
                                  cursorColor: Colors.black,
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
                                        fontSize: 15),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        _togglePasswordVisibility();
                                      },
                                      child: Icon(
                                        _isHidePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: _isHidePassword
                                            ? Colors.indigo
                                            : Colors.indigo,
                                      ),
                                    ),
                                    isDense: true,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter Password';
                                    } else if (value.length < 8) {
                                      return 'Password must be 8 characters!';
                                    }
                                    return null;
                                  },
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
                          color:
                              Color.fromRGBO(196, 135, 198, 1).withOpacity(0.5),
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
                    // Container(
                    //   height: 50,
                    //   margin: EdgeInsets.symmetric(horizontal: 60),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(50),
                    //     //color: Color.fromRGBO(49, 39, 79, 1),
                    //   ),
                    //   child:
                    Center(
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                        color: Color.fromRGBO(49, 39, 79, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(30),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Nunito'),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            auth
                                .signInEmail(emailController.text,
                                    passwordController.text)
                                .then((User user) {
                              if (user != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      //return SuccessScreen();
                                      return NavigationDrawer();
                                    },
                                  ),
                                );
                              }
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //sign up / register
                  FadeAnimation(
                    2,
                    // Center(
                    //     child: Text(
                    //   "--- Sign in with ---",
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(196, 135, 198, 1),
                    //       fontFamily: 'Nunito',
                    //       fontSize: 13),
                    // ))
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color:
                                Color.fromRGBO(49, 39, 79, 1).withOpacity(0.5),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "OR",
                          style: TextStyle(
                            color: Color.fromRGBO(196, 135, 198, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color:
                                Color.fromRGBO(49, 39, 79, 1).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  return Welcome();
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
