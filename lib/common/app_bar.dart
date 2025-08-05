import 'package:flutter/material.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    backgroundColor: Colors.deepPurple,
    centerTitle: true,
  );
}
