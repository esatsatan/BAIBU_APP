import 'package:flutter/material.dart';
import 'dart:io';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage("images/blank-profile-picture-973460__340.webp"),
            ),
          ],
        ),
      ),
    );
  }
}

