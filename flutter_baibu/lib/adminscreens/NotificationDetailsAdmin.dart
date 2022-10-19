import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_baibu/adminscreens/AdminHomePage.dart';
import 'package:flutter_baibu/adminscreens/DuyuruDuzenle.dart';

class DetailScreenAdmin extends StatefulWidget {
  const DetailScreenAdmin({Key? key, required this.gelenVeri}) : super(key: key);
    final Map gelenVeri;
  @override
  State<DetailScreenAdmin> createState() => _DetailScreenAdminState();
}

class _DetailScreenAdminState extends State<DetailScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DUYURU'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Sil',
            onPressed: (() {
               Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const adminHomePage()));
            }),
          )
        ],
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
                        widget.gelenVeri['baslik'].toString(),    
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
                        widget.gelenVeri['icerik'].toString(),
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
