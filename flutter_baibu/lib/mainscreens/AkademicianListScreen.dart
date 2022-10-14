import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Academician').snapshots();

  /* Future getAllAcademician() async {
    await _firestore
        .collection('Academician')
        .get()
        .then((snaphot) => snaphot.docs.forEach((element) {
              print(element.get('Email'));
              print(element.get('Name'));
              print(element.get('Phone'));

              var names = element.get('Name');
              var emails = element.get('Email');

              name.add(names);
              name.add(emails);
            }));
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151543),
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Akademisyenler'),
        backgroundColor: Color(0xff151543),
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
                    return AcademicianCard(
                      name: data['Name'] as String,
                      email: data['Email'] as String,
                    );
                  })
                  .toList()
                  .cast(),
            );
          }),
    );
  }
}
