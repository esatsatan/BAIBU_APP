import 'package:flutter/material.dart';

class BildirimItem extends StatelessWidget {
  final String description;
  final String time;

  BildirimItem({required this.description, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: 130,
      decoration: BoxDecoration(
        color: Color(0xff2F2F42),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 241, 236, 236).withOpacity(0.6),
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: -6.0),
        ],
      ),
      child: Stack(
        children: [
          Align(
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(10),
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: Image.asset('images/aibu_logo.jpg'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5, right: 5, left: 5),
                          child: Icon(
                            Icons.timelapse,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
