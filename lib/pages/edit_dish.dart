import 'package:flutter/material.dart';
import 'package:matapp/services/dish.dart';

class EditDish extends StatefulWidget {
  const EditDish({Key? key}) : super(key: key);

  @override
  State<EditDish> createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {

  final colorBackground = Color.fromRGBO(235, 246, 232, 1.0);
  final colorWhite = Color.fromRGBO(244, 244, 244, 1.0);
  final colorGray = Color.fromRGBO(60, 61, 60, 1.0);
  final colorBlue = Color.fromRGBO(87, 174, 211, 1.0);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Dish;
    final cardMargin = 7.5;

    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: colorGray,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: cardMargin * 2,
        title: Text(
          "Redigera maträtt",
          style: TextStyle(
            color: colorGray,
            fontFamily: "Roboto-Bold",
            fontSize: 18.0,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(cardMargin * 2, cardMargin, cardMargin * 2, cardMargin * 6),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text("Namn"),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: args.name,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.question_mark),
                  Icon(Icons.question_mark),
                  Icon(Icons.question_mark),
                  Icon(Icons.question_mark),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("Tillagningstid i minuter"),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: args.time,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("Beskrivning"),
            ),
            Expanded(
              flex: 10,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: args.desc,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.delete),
                      style: ElevatedButton.styleFrom(
                        primary: colorBlue,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Spara ändringar"),
                      style: ElevatedButton.styleFrom(
                        primary: colorBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}