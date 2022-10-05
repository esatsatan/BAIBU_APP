import 'package:flutter/material.dart';
import '../Profil_Icerigi/ProfiliniDuzenle.dart';

class ProfilMenu extends StatelessWidget {
  const ProfilMenu({Key? key, required this.text, this.press})
      : super(key: key);

  final String text;
  final VoidCallback? press;

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SizedBox(width: 20),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
