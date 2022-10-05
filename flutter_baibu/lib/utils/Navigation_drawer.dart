import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../mainscreens/AkademicianListScreen.dart';
import '../mainscreens/BildirimList.dart';
import '../mainscreens/ProfileScreen.dart';
import '../mainscreens/StudentHomeScreen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff0364f6),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            buildMenuItem(
              text: 'Anasayfa',
              icon: Icons.home,
              onClicked: () => selecteditem(context, 0),
            ),
            SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Akademisyen',
              icon: Icons.cast_for_education_rounded,
              onClicked: () => selecteditem(context, 1),
            ),
            SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Bildirim',
              icon: Icons.notifications,
              onClicked: () => selecteditem(context, 2),
            ),
            SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Profil',
              icon: Icons.person,
              onClicked: () => selecteditem(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  void selecteditem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StudentHomeScreen(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AcademicianList(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BildirimList(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ));
        break;
    }
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
  final color = Colors.white;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    onTap: onClicked,
  );
}
