import 'package:flutter/material.dart';
import 'package:matapp/services/dish.dart';
import 'package:matapp/pages/home.dart';

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

  final textControllerName = TextEditingController();
  final textControllerTime = TextEditingController();
  final textControllerDesc = TextEditingController();

  HomeState homeState = HomeState();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textControllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Dish;

    textControllerName.text = args.name;
    textControllerTime.text = args.time;
    textControllerDesc.text = args.desc;

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
        margin: EdgeInsets.fromLTRB(cardMargin * 2, cardMargin, cardMargin * 2, cardMargin * 3),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: textControllerName,
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
                controller: textControllerTime,
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
              flex: 5,
              child: Container(
                color: Colors.transparent,
                child: TextFormField(
                  controller: textControllerDesc,
                  minLines: 6,
                  maxLines: 6,
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
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.question_mark),
                    Icon(Icons.question_mark),
                    Icon(Icons.question_mark),
                    Icon(Icons.question_mark),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: colorBlue,
                            minimumSize: const Size(double.infinity, double.infinity),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(Icons.delete, size: 32.0,),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 12,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              "okidoki",
                            );
                            print(textControllerName.text);
                            print(textControllerTime.text);
                            print(textControllerDesc.text);

                            homeState.addDish(Dish(name: "Äppelpaj m. vaniljsås", time: "30-40", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."));

                          },
                          style: ElevatedButton.styleFrom(
                            primary: colorBlue,
                            minimumSize: Size(double.infinity, double.infinity),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                          ),
                          child: const Text("Spara ändringar", style: TextStyle(fontSize: 16.0),),
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