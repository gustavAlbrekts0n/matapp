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
    final fontSizeLabel = 20.0;
    final fontSizeDesc = 14.0;

    return Scaffold(
      backgroundColor: colorWhite,
      resizeToAvoidBottomInset: false,
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
        margin: EdgeInsets.fromLTRB(cardMargin * 2, cardMargin, cardMargin * 2, cardMargin * 2),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                initialValue: args.name,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: colorGray,
                    fontFamily: "Roboto",
                    fontSize: fontSizeLabel,
                  ),
                  labelText: "Namn",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBlue, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: colorGray,
                  fontFamily: "Roboto",
                  fontSize: fontSizeDesc,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                initialValue: args.time,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: colorGray,
                    fontFamily: "Roboto",
                    fontSize: fontSizeLabel,
                  ),
                  labelText: "Tillagningstid i minuter",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBlue, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: colorGray,
                  fontFamily: "Roboto",
                  fontSize: fontSizeDesc,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 7,
              child: TextFormField(
                initialValue: args.desc,
                minLines: 7,
                maxLines: 7,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: colorGray,
                    fontFamily: "Roboto",
                    fontSize: fontSizeLabel,
                  ),
                  labelText: "Beskrivning",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBlue, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: colorGray,
                  fontFamily: "Roboto",
                  fontSize: fontSizeDesc,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.greenAccent,
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
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.red,
                child: Container(
                  height: 50,
                  color: Colors.purple,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        flex: 5,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}