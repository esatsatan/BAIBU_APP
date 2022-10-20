import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_baibu/adminscreens/NotificationDetailsAdmin.dart';

import '../mainscreens/NotificationDetailScreen.dart';

class adminHomePage extends StatefulWidget {
  const adminHomePage({Key? key}) : super(key: key);

  @override
  State<adminHomePage> createState() => _adminHomePageState();
}

class _adminHomePageState extends State<adminHomePage> {
  String name = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Announcement').snapshots();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var controller;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'ANASAYFA',
            style: TextStyle(color: Colors.white),
          ),
          bottom: PreferredSize(
            preferredSize: Size(6, 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: controller,
                      onFieldSubmitted: (convariant) {
                        setState(() {
                          var text = convariant;
                        });
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: 'ARAMA',
                          hintStyle: TextStyle(fontSize: 15)),
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xff151543),
        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Colors.lightBlue.shade400,
                    Colors.lightBlue.shade900,
                  ])),
                  child: Container(
                    child: Center(
                      child: Image.asset('images/birincilogo_3559696.png'),
                    ),
                  ),
                ),
                myDrawerItems(
                    Icons.library_add, 'Duyuru Ekle.', "/Duyuru Ekle"),
                new Divider(
                  color: Colors.black,
                ),
                myDrawerItems(Icons.login_outlined, 'Çıkış Yap.', "/Cıkıs Yap"),
                new Divider(
                  color: Colors.black,
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xff0364f6),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    if (name.isEmpty) {
                      return Container(
                                                height: 70,
                        width: 15,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(
                                  3.0,
                                  3.0,
                                ),
                                blurRadius: 7.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: ListTile(
                          title: Text(
                            data['baslik'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                              data['yayinlayan'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              child: Image.asset(
                                'images/birincilogo_3559696.png',
                                height: 100,
                                width: 100,
                              ),
                              backgroundColor: Colors.white,
                            ),
                        ),
                      );
                    }
                    if (data['baslik']
                        .toString()
                        .toLowerCase()
                        .startsWith(name.toLowerCase())) {
                      return Container(                        height: 70,
                        width: 15,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(
                                  3.0,
                                  3.0,
                                ),
                                blurRadius: 7.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: ListTile(
                          title: Text(
                            data['baslik'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                              data['yayinlayan'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              child: Image.asset(
                                'images/birincilogo_3559696.png',
                                height: 100,
                                width: 100,
                              ),
                              backgroundColor: Colors.white,
                            ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreenAdmin(
                                      gelenVeri: data,
                                    )))
                      },
                      child: Container(
                      ),
                    );
                  })
                  .toList()
                  .cast(),
            );
          },
        ),
        backgroundColor: Color(0xff151543),
      ),
    );
  }

  Widget myDrawerItems(IconData icon, String title, String routeName) =>
      ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          onTap: () {
            _scaffoldKey.currentState?.openEndDrawer();
            Navigator.pushNamed(context, routeName);
          });
}
