import 'package:flutter/material.dart';
import '../../../loginscreens/FirstScreen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import '../Profil_Icerigi/ProfiliniDuzenle.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfilMenu(
            text: 'Hesabını Düzenle',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilDuzenle(),
                ),
              );
            },
          ),
          ProfilMenu(
            text: 'Çıkış Yap',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
