import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_baibu/loginscreens/SuccessScreen.dart';
import 'package:flutter_baibu/service/auth.dart';

import '../mainscreens/StudentHomeScreen.dart';
import 'AdminLogin.dart';
import 'ResetPassword.dart';
import 'SignUp.dart';

class StudentLogin extends StatefulWidget {
  // const StudentLogin({Key? key}) : super(key: key);

  @override
  _StudentLoginState createState() => _StudentLoginState();
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Email',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 228, 228, 231),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff000000),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.black38,
              )),
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Password',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Color(0xe4f6f6f6),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
            ]),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff000000),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    ],
  );
}

Widget buildForgotPasswordButton(BuildContext context) {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResetPassword(),
        ),
      ),
      //padding: EdgeInsets.only(top: 20.0),
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildLoginButton(String text, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      //elevation: 5,
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const StudentHomeScreen(),
        ),
      ),
      //padding: EdgeInsets.all(15),
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      //color: Color(0xff0364f6),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildSignUpButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUp())),
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
          text: 'Hesabınız yok mu? ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: 'Kayıt Olun',
          style: TextStyle(
              color: Color(0xff0364f6),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ]),
    ),
  );
}

Widget buildAcademicianButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AdminLogin())),
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
          text: 'Akademisyen Misiniz? ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: 'Giriş Yapın',
          style: TextStyle(
              color: Color(0xff0364f6),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ]),
    ),
  );
}

class _StudentLoginState extends State<StudentLogin> {
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  AuthService _authService = AuthService();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SuccessScreen();
          } else {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                child: Stack(
                  children: [
                    Form(
                      key: formKey,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff151543),
                                Color(0xff151543),
                                Color(0xff151543),
                                Color(0xff151543),
                              ]),
                        ),
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 120,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Giriş Yap',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 228, 228, 231),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2)),
                                        ]),
                                    height: 60,
                                    child: TextFormField(
                                      controller: emailCont,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 14),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Color(0xff000000),
                                        ),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                          color: Colors.black38,
                                        ),
                                      ),
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Geçerli bir mail adresi giriniz";
                                        } else {
                                          return null;
                                        }
                                      }),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Color(0xe4f6f6f6),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2)),
                                        ]),
                                    height: 60,
                                    child: TextFormField(
                                      controller: passwordCont,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 14),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Color(0xff000000),
                                        ),
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          color: Colors.black38,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Geçerli bir şifre giriniz";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              buildForgotPasswordButton(context),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                width: double.infinity,
                                child: ElevatedButton(
                                  //elevation: 5,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      _authService
                                          .signIn(
                                              emailCont.text, passwordCont.text)
                                          .then((value) => {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (BuildContext context) {
                                                      return StudentHomeScreen();
                                                    },
                                                  ),
                                                  (route) => false,
                                                ),
                                              });
                                    }
                                  },
                                  //padding: EdgeInsets.all(15),
                                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  //color: Color(0xff0364f6),
                                  child: Text(
                                    'Giriş Yap',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              buildSignUpButton(context),
                              SizedBox(height: 20),
                              buildAcademicianButton(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
