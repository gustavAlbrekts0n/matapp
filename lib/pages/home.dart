import 'package:flutter/material.dart';
import 'package:matapp/services/dish.dart';
import 'package:matapp/services/dishService.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  final DishService _dishService = DishService();

  final textControllerName = TextEditingController();
  final textControllerTime = TextEditingController();
  final textControllerDesc = TextEditingController();

  final colorBackground = const Color.fromRGBO(235, 246, 232, 1.0);
  final colorWhite = const Color.fromRGBO(244, 244, 244, 1.0);
  final colorGray = const Color.fromRGBO(60, 61, 60, 1.0);
  final colorBlue = const Color.fromRGBO(87, 174, 211, 1.0);

  final double fontSizeFormLabel = 18.0;

  final cardMargin = 7.5;

  List<Dish> dishList = [
    Dish(name: "Köttfärssås och spaghetti", time: "20", desc: "Favoritmat nummer ett! Alla - oavsett ålder - älskar spagetti och köttfärssås! Här är ett smakfullt och pålitligt recept som du lyckas med. Servera gärna med riven parmesanost."),
    Dish(name: "Panerad torsk med potatismos", time: "15", desc: "Fisk är både gott och nyttigt! Extra smarrig blir fisken med en god panering och ett krämigt mos till. Servera med kokt broccoli som fortfarande får behålla lite krispighet och lite citron att pressa på toppen."),
    Dish(name: "Risotto m. svamp och tomat", time: "30", desc: "En riktigt krämig risotto med goda smaker av svamp, spenat och tomat. Följ det här receptet och du har alla chanser att lyckas med en perfekt kokt risotto med stor krämighet och det perfekta lilla tuggmotståndet. När du lärt dig grunden är det lätt att variera din risotto med andra smaker."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: cardMargin * 2,
        title: Text(
          "Maträtter",
          style: TextStyle(
            color: colorGray,
            fontFamily: "Roboto-Bold",
            fontSize: 18.0,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, cardMargin, 0),
            child: IconButton(
              onPressed: () {
                print("Coming soon...");
              },
              icon: const Icon(Icons.sort),
              color: colorGray,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(cardMargin * 2, cardMargin, cardMargin * 2, cardMargin * 6),
        child: ListView.builder(
          itemCount: dishList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
          return Card(
            color: colorWhite,
            elevation: 2.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: ExpansionTile(
              title: Text(dishList[index].name, style: TextStyle(color: colorGray, fontFamily: "Roboto",),),
              subtitle: Text("${dishList[index].time} min", style: TextStyle(color: colorGray, fontFamily: "Roboto",),),
              textColor: colorGray,
              iconColor: colorGray,
              collapsedTextColor: colorGray,
              collapsedIconColor: colorGray,
              tilePadding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 2.0),
              childrenPadding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 12.0),
              children: [
                Column(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishList[index].desc,
                      style: TextStyle(
                        color: colorGray,
                        fontFamily: "Roboto",
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            /*
                            final returnDish = Navigator.pushNamed(
                              context,
                              "/edit",
                              arguments: Dish(
                                name: dishList[index].name,
                                time: dishList[index].time,
                                desc: dishList[index].desc,
                              ),
                            );
                            print(returnDish);
                             */
                            textControllerName.text = dishList[index].name;
                            textControllerTime.text = dishList[index].time;
                            textControllerDesc.text = dishList[index].desc;

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text("Redigera maträtt"),
                                    content:
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: TextFormField(
                                            controller: textControllerName,
                                            minLines: 1,
                                            maxLines: 1,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              labelStyle: TextStyle(
                                                color: colorGray,
                                                fontFamily: "Roboto",
                                                fontSize: fontSizeFormLabel,
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
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: TextFormField(
                                            controller: textControllerTime,
                                            minLines: 1,
                                            maxLines: 1,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelStyle: TextStyle(
                                                color: colorGray,
                                                fontFamily: "Roboto",
                                                fontSize: fontSizeFormLabel,
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
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: TextFormField(
                                            controller: textControllerDesc,
                                            minLines: 1,
                                            maxLines: 1,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              labelStyle: TextStyle(
                                                color: colorGray,
                                                fontFamily: "Roboto",
                                                fontSize: fontSizeFormLabel,
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
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {

                                              // Kontrollera så att alla fält är ifyllda
                                              if (textControllerName.text.isNotEmpty && textControllerTime.text.isNotEmpty && textControllerDesc.text.isNotEmpty) {

                                                updateDish(index);

                                              } else {
                                                print("Empty field(s)!");
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: colorBlue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                )
                                            ),
                                            child: const Text("Spara"),
                                          ),
                                        ),
                                      ],
                                    )
                                );
                              },
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            minimumSize: const Size(26.0, 26.0),
                            alignment: Alignment.center,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 26.0,
                            color: colorGray,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              dishList.removeAt(index);
                            });
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            minimumSize: const Size(26.0, 26.0),
                            alignment: Alignment.center,
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 26.0,
                            color: colorGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //TODO: Se även till att bli av med fula gråa linjerna som dyker upp vid expandering.
              ],
            ),
          );
        })
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorBlue,
        onPressed: () {
          /*
          //TODO: Kunna påverka dish_list globalt och lokalt.
          addDish(Dish(name: "Kalles kaviar", time: "1", desc: "Djävulens påfundDjävulens påfundDjävulens påfundDjävulens påfundDjävulens påfundDjävulens påfundDjävulens påfundDjävulens påfund"));
          print(dishList.length);
          //Navigator.pushNamed(context, "/add");
           */
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Lägg till maträtt"),
                  content:
                      /*Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(Icons.close),
                            ),
                          ),
                      ),*/
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: textControllerName,
                              minLines: 1,
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color: colorGray,
                                  fontFamily: "Roboto",
                                  fontSize: fontSizeFormLabel,
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
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: textControllerTime,
                              minLines: 1,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color: colorGray,
                                  fontFamily: "Roboto",
                                  fontSize: fontSizeFormLabel,
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
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: textControllerDesc,
                              minLines: 1,
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color: colorGray,
                                  fontFamily: "Roboto",
                                  fontSize: fontSizeFormLabel,
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
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {

                                // Kontrollera så att alla fält är ifyllda
                                if (textControllerName.text.isNotEmpty && textControllerTime.text.isNotEmpty && textControllerDesc.text.isNotEmpty) {

                                  addButtonPressed();

                                } else {
                                  print("Empty field(s)!");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: colorBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )
                              ),
                              child: const Text("Spara"),
                            ),
                          ),
                        ],
                      )
                );
              },
          );
        },
        child: const Icon(
          Icons.add_rounded,
          size: 32.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void addDish(Dish dish) {
    setState(() {
      dishList.add(dish);
    });
  }

  void addButtonPressed() {
    // Lägg till maträtt i listan
    addDish(Dish(
        name: textControllerName.text,
        time: textControllerTime.text,
        desc: textControllerDesc.text
    ));

    clearControllers();

    // Lämna rutan
    Navigator.of(context).pop();
  }

  void updateDish(int index) {
    setState(() {
      dishList[index] = Dish(
          name: textControllerName.text,
          time: textControllerTime.text,
          desc: textControllerDesc.text
      );
    });

    clearControllers();

    // Lämna rutan
    Navigator.of(context).pop();
  }

  void clearControllers() {
    // Rensa controllers för tomma fält inför nästa gång
    textControllerName.clear();
    textControllerTime.clear();
    textControllerDesc.clear();
  }
}
