import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/AkademicianItem.dart';
import '../utils/Navigation_drawer.dart';

class AcademicianList extends StatefulWidget {
  const AcademicianList({Key? key}) : super(key: key);

  @override
  State<AcademicianList> createState() => _AcademicianListState();
}

class _AcademicianListState extends State<AcademicianList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Akademisyenler'),
        backgroundColor: Color(0xff151543),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xff151543),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    AcademicianCard(
                      name: ' Murat Beken',
                      email: 'murat.beken@gmail.com',
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
