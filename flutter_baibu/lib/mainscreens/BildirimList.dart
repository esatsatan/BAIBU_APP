import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import '../utils/BildirimItem.dart';
import '../utils/Navigation_drawer.dart';

class BildirimList extends StatefulWidget {
  const BildirimList({Key? key}) : super(key: key);

  @override
  State<BildirimList> createState() => _BildirimListState();
}

class _BildirimListState extends State<BildirimList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Bildirim'),
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
                    BildirimItem(
                      description: ' Ders Programi Güncellendi.',
                      time: '12.12.2022',
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
