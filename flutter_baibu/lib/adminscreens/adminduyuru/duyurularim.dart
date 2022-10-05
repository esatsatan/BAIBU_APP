import 'package:flutter/material.dart';

import 'DuyuruDuzenle.dart';

class duyurularim extends StatefulWidget {
  const duyurularim({Key? key}) : super(key: key);

  @override
  State<duyurularim> createState() => _duyurularimState();
}

class _duyurularimState extends State<duyurularim> {
  @override
  Widget build(BuildContext context) {
    var controller;
    return Scaffold(
      appBar: AppBar(
        title: Text('DUYURULARIM'),
         bottom: PreferredSize(
            preferredSize: Size(6,50) ,
             child: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(7),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: controller,

                      onFieldSubmitted: (convariant){
                        setState(() {
                          var text = convariant;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: 'ARAMA',
                        hintStyle: TextStyle(fontSize: 15)
                      ),
                    ),
                  ),
                  ),
                ],
            ),
            ),

        backgroundColor: Color(0xff151543),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
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
                leading: CircleAvatar(
                  child: Image.asset('images/birincilogo_3559696.png'),
                  backgroundColor: Colors.white,
                ),
                title: Text('Baslik',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                subtitle: Text('yayinlayan',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                trailing: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff0364f6),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DuyuruDuzenleme()));
                  },
                  child: Text(
                    'Düzenle',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            );
          }),
      backgroundColor: const Color(0xff151543),
    );
  }
}
