import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_baibu/service/auth.dart';
import 'package:image_picker/image_picker.dart';

import '../loginscreens/StudentLogin.dart';
import 'AboutScreen.dart';
import 'EditProfile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _authservice = AuthService();

  File? image;
  UploadTask? uploadTask;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });
      //uploadFile();
      final path = '${_auth.currentUser!.uid}.jpg';
      final file = File(image!.path);

      final ref = FirebaseStorage.instance.ref().child(path);

      await ref.putFile(file);
      final url = await ref.getDownloadURL();
      print('Download URL : $url');
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future uploadFile() async {
    final path = '${_auth.currentUser!.uid}.jpg';
    final file = File(image!.path);

    final ref = FirebaseStorage.instance.ref().child('images/');

    ref.child(path).putFile(file);
    final url = ref.getDownloadURL();
    print('Download URL : $url');
  }

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
                      Center(
                        child: SizedBox(
                          height: 115,
                          width: 115,
                          child: Stack(
                            fit: StackFit.expand,
                            clipBehavior: Clip.none,
                            children: [
                              image != null
                                  ? GestureDetector(
                                      onTap: () =>
                                          pickImage(ImageSource.gallery),
                                      child: ClipOval(
                                        child: Image.file(
                                          image!,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () =>
                                          pickImage(ImageSource.gallery),
                                      child: FlutterLogo(size: 200)),
                            ],
                          ),
                        ),
                      ),
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              bottom: 20,
                              top: 10,
                            ),
                            child: Text(
                              'Email : ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              left: 5,
                            ),
                            child: Text(
                              _auth.currentUser!.email.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                          _authservice.signOut();

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return StudentLogin();
                              },
                            ),
                            (route) => false,
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
