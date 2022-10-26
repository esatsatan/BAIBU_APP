import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _authservice = AuthService();

  File? image;
  String? photoUrl;
  String? url;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future uploadFile() async {
    final path = '${_auth.currentUser!.uid}.jpg';
    final file = File(image!.path);

    final ref = FirebaseStorage.instance
        .ref()
        .child('images/${_auth.currentUser!.uid}.jpg');

    await ref.putFile(file);
    final url = await ref.getDownloadURL();

    setState(() {
      photoUrl = url.toString();
    });

    _firestore
        .collection('Users')
        .doc(_auth.currentUser!.uid.toString())
        .update({'photoUrl': photoUrl});
  }

  downloadImage() {
    final docRef =
        _firestore.collection('Users').doc(_auth.currentUser!.uid.toString());
    docRef.get().then(
      (DocumentSnapshot doc) {
        if (doc.get('photoUrl').toString() != '') {
          final data = doc.get('photoUrl');

          setState(() {
            photoUrl = data.toString();
          });
        }

        onError:
        (e) => print("Error getting document: $e");
      },
    );
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    downloadImage();
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
                              photoUrl != null
                                  ? ClipOval(
                                      child: Image.network(
                                        photoUrl!,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : FlutterLogo(
                                      size: 200,
                                    ),
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
                      ListTile(
                        onTap: () {
                          pickImage(ImageSource.gallery);
                        },
                        title: Text(
                          'Galeriden Fotoğraf Seç',
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
                          uploadFile();
                          //savePhotoUrl();
                        },
                        title: Text(
                          'Fotoğrafı Kaydet',
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
