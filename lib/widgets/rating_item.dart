import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {

  final int index;
  final int rating;

  RatingItem({this.index, this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(

      index <= rating ? 'assets/iamges/bintang1.png' : 'assets/images/bintang2.png'

      'assets/icon_Start.png',
      width: 20,
    );
  }
}