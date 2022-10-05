import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duyuru'),
        backgroundColor: Color(0xff151543),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xff151543),
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 10, bottom: 30),
                      child: Text(
                        'Duyuru Baslik',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        'sdfsdfdfdfdfdfdfddfdfdfddffddfdfddfddddfddfdfdfdfssssssssssssssssssssssssssssssssssssssssssssssssssffffffffffffff',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
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