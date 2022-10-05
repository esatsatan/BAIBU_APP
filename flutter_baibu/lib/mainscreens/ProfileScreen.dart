import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_baibu/service/auth.dart';

import '../adminscreens/AdminProfilScreens/tasarim/profile_pic.dart';
import '../loginscreens/StudentLogin.dart';
import 'AboutScreen.dart';
import 'EditProfile.dart';

class ProfileScreen extends StatelessWidget {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xff151543),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xff151543),
                width: double.infinity,
                height: screenSize.height * .35,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      // Text(
                      // 'Profil',
                      //style: TextStyle(
                      //color: Colors.white,
                      //fontWeight: FontWeight.bold,
                      //fontSize: 24,
                      //),
                      //),
                      ProfilePic(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color(0xff151543),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ),
                        ),
                        title: Text(
                          'Profili Düzenle',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AboutScreen(),
                          ),
                        ),
                        title: Text(
                          'Hakkında',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          _authService.signOut();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => StudentLogin(),
                            ),
                          );
                        },
                        title: Text(
                          'Çıkış yap',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
