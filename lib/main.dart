import 'package:flutter/material.dart';
import 'package:matapp/pages/home.dart';
import 'package:matapp/pages/add_dish.dart';
import 'package:matapp/pages/edit_dish.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Home(),
      "/add": (context) => AddDish(),
      "/edit": (context) => EditDish(),
    },
  ));
}