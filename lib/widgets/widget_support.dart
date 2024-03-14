import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle semiBoldTextStyle() {
    return const TextStyle(
        fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Poppins');
  }

  static TextStyle headLineText() {
    return const TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins');
  }

  static TextStyle lightText() {
    return const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black38);
  }

  static TextStyle semiText() {
    return const TextStyle(
        fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.bold);
  }
}
