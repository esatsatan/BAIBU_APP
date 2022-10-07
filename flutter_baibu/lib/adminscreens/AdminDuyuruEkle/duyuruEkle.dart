import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../adminduyuru/duyurularim.dart';

class duyuruEkle extends StatefulWidget {
  const duyuruEkle({Key? key}) : super(key: key);

  @override
  State<duyuruEkle> createState() => _duyuruEkleState();
}

class _duyuruEkleState extends State<duyuruEkle> {
  final _duyurubaslik = TextEditingController();
  final _duyuruIcerigi = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future duyuruKaydet(String baslik, String duyuru) async {
    final yayinlananDuyuru = <String, String>{
      'baslik': baslik,
      'icerik': duyuru,
    };

    _firestore.collection("Announcement").add(yayinlananDuyuru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DUYURU EKLE'),
        backgroundColor: Color(0xff151543),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("images/birincilogo_3559696.png"),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 350,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TextField(
                  controller: _duyurubaslik,
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Baslik Ekle...',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Mulish-SemiBold",
                    ),
                  ),
                ),
              ),
              Container(
                height: 300,
                width: 350,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TextField(
                  controller: _duyuruIcerigi,
                  minLines: 1,
                  maxLines: 25,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Duyurunuzu Yaziniz ...',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Mulish-SemiBold",
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff0364f6),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                        onPressed: () {
                          duyuruKaydet(_duyurubaslik.text, _duyuruIcerigi.text);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const duyurularim()));
                        },
                        child: Text(
                          'DUYURUNU YAYINLA',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff151543),
    );
  }
}
