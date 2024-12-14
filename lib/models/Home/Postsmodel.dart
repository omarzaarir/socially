import 'package:flutter/material.dart';

class Postsmodel {
  String imageUrl;
  int shareerId;
  int comentnumber;
  int likednumber;
  int positiveed;
  String personalimageurl;
  String personName;
  TimeOfDay timepost;

  Postsmodel({
    required this.comentnumber,
    required this.imageUrl,
    required this.likednumber,
    required this.personName,
    required this.personalimageurl,
    required this.positiveed,
    required this.shareerId,
    required this.timepost,
  });
}
