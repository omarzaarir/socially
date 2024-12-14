import 'package:flutter/material.dart';
import 'package:gallery/styles/styles.dart';

Text text_16(String txt) => Text(
      txt,
      style: TextStyle(
          color: AppStyle.colors.gray,
          fontFamily: AppStyle.firstAppFont,
          fontSize: 16,
          fontStyle: FontStyle.normal),
    );
Text text_39(String txt) => Text(
      txt,
      style: TextStyle(
        color: AppStyle.colors.black,
        fontFamily: AppStyle.firstAppFont,
        fontSize: 39,
        fontWeight: FontWeight.bold,
      ),
    );
