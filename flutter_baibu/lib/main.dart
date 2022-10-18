import 'package:flutter/material.dart';
import 'package:flutter_baibu/loginscreens/FirstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_baibu/loginscreens/StudentLogin.dart';
import 'package:flutter_baibu/mainscreens/EditProfile.dart';
import 'package:flutter_baibu/mainscreens/ProfileScreen.dart';
import 'package:flutter_baibu/mainscreens/StudentHomeScreen.dart';
import 'adminscreens/AddAnnouncement.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/Duyuru Ekle": (context) => duyuruEkle(),
        "/Cıkıs Yap": (context) => SplashScreen(),
      },
      color: Color(0xff1F1F39),
      home: SplashScreen(),
    );
  }
}
