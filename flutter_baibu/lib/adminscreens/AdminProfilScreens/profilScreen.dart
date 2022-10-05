import 'package:flutter/material.dart';
import 'tasarim/body.dart';

class profilScreen extends StatefulWidget {
  const profilScreen({Key? key}) : super(key: key);

  @override
  State<profilScreen> createState() => _profilScreenState();
}

class _profilScreenState extends State<profilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFIL'),
        backgroundColor: Color(0xff151543),
      ),
      body: Body(),
      backgroundColor: const Color(0xff151543),
    );
  }
}
