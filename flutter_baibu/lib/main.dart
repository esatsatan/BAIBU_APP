import 'package:flutter/material.dart';
import 'package:flutter_baibu/loginscreens/FirstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'adminscreens/AdminDuyuruEkle/duyuruEkle.dart';
import 'adminscreens/AdminProfilScreens/profilScreen.dart';
import 'adminscreens/adminduyuru/duyurularim.dart';

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
        "/Duyurularım": (context) => duyurularim(),
        "/Duyuru Ekle": (context) => duyuruEkle(),
        "/Profil": (context) => profilScreen(),
      },
      color: Color(0xff1F1F39),
      home: SplashScreen(),
    );
  }
}
