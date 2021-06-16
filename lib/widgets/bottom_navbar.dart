import 'package:flutter/material.dart';
import 'package:kosan/models/space.dart';
import 'package:kosan/theme.dart';

class BottomNavbar extends StatelessWidget {

  String imageUrl;
  bool isActive;

  BottomNavbar({this.imageUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive ? Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(1000),
            )
          )
        ) : Container(),
      ],
    );
  }
}