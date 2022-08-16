import 'package:flutter/material.dart';

class EditDish extends StatefulWidget {
  const EditDish({Key? key}) : super(key: key);

  @override
  State<EditDish> createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Redigera maträtt"),
    );
  }
}
