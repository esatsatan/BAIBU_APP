import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_baibu/service/auth.dart';
import '../utils/Navigation_drawer.dart';
import '../utils/NotificationItem.dart';
import 'NotificationDetailScreen.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Announcement').snapshots();

  String name = "";

  late Map alinanVeri;

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search..'),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
        ),
        backgroundColor: Color(0xff151543),
        elevation: 5.0,
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

            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: const Color(0xff151543),
                  child: Stack(
                    children: [
                      Column(
                        verticalDirection: VerticalDirection.down,
                        children: [
                          Container(
                            width: double.infinity,
                            height: size.height * .30,
                            color: Color(0xff0364f6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 110.0),
                                  child: Text(
                                    '        Merhaba',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                  width: 10,
                                ),
                                Text(
                                  '        Bilgisayar Mühendisliği',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 500,
                              color: Color(0xff151543),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;

                                      if (name.isEmpty) {
                                        return GestureDetector(
                                          onTap: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              gelenVeri: data,
                                            ),
                                          )),
                                          child: CardItem(
                                              title: data['baslik'] as String,
                                              publisher:
                                                  data['yayinlayan'] as String),
                                        );
                                      }
                                      if (data['baslik']
                                          .toString()
                                          .toLowerCase()
                                          .startsWith(name.toLowerCase())) {
                                        return GestureDetector(
                                          onTap: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              gelenVeri: data,
                                            ),
                                          )),
                                          child: CardItem(
                                              title: data['baslik'] as String,
                                              publisher:
                                                  data['yayinlayan'] as String),
                                        );
                                      }
                                      return GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                            gelenVeri: data,
                                          ),
                                        )),
                                        /*  child: CardItem(
                                            title: data['baslik'] as String,
                                            publisher:
                                                data['yayinlayan'] as String,
                                          ), 
                                        */
                                        child: Container(),
                                      );
                                    })
                                    .toList()
                                    .cast(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
