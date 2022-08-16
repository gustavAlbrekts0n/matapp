import 'package:flutter/material.dart';
import 'package:matapp/services/dish.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final colorBackground = Color.fromRGBO(235, 246, 232, 1.0);
  final colorWhite = Color.fromRGBO(244, 244, 244, 1.0);
  final colorGray = Color.fromRGBO(60, 61, 60, 1.0);
  final colorBlue = Color.fromRGBO(87, 174, 211, 1.0);

  final cardMargin = 8.0;

  List<Dish> dishes = [
    Dish(name: "Köttfärssås och spaghetti", time: "20 min"),
    Dish(name: "Panerad torsk med potatismos", time: "15 min"),
    Dish(name: "Risotto m. svamp och tomat", time: "30 min"),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min"),
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
              onPressed: () {},
              icon: Icon(Icons.sort),
              color: colorGray,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (context, index) {
        return Card(
          color: colorWhite,
          margin: EdgeInsets.fromLTRB(cardMargin * 2, cardMargin, cardMargin * 2, cardMargin),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListTile(
            onTap: () {
              print(dishes[index].time);
            },
            title: Text(
              dishes[index].name,
              style: TextStyle(
                color: colorGray,
                fontFamily: "Roboto",
              ),
            ),
            subtitle: Text(
              dishes[index].time,
              style: TextStyle(
                color: colorGray,
                fontFamily: "Roboto-Bold",
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: colorGray,
              size: 32,
            ),
          ),
        );
      }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorBlue,
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: const Icon(
          Icons.add_rounded,
          size: 32.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

//ElevatedButton(
//  onPressed: () {
//    Navigator.pushNamed(context, "/add");
//  },
//  child: Icon(Icons.add),
//  style: ElevatedButton.styleFrom(
//    shape: CircleBorder(),
//    primary: colorBlue,