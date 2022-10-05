import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../utils/Navigation_drawer.dart';
import '../utils/NotificationItem.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Ana Sayfa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff151543),
        elevation: 5.0,
      ),
      body: Stack(
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
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 110.0),
                            child: Text(
                              'Merhaba, Simge',
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
                            'Bilgisayar Mühendisliği',
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
                          children: [
                            CardItem(
                                title: 'title',
                                time: 'time',
                                publisher: 'publisher'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
