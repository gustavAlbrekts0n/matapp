import 'package:flutter/material.dart';
import 'package:matapp/services/dish.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final colorBackground = Color.fromRGBO(235, 246, 232, 1.0);
  final colorWhite = Color.fromRGBO(241, 238, 238, 1.0);
  final colorGray = Color.fromRGBO(60, 61, 60, 1.0);
  final colorBlue = Color.fromRGBO(87, 174, 211, 1.0);

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
        backgroundColor: colorWhite,
        title: Text(
          "Maträtter",
          style: TextStyle(color: colorGray),
        ),
      ),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListTile(
            onTap: () {
              print(dishes[index].time);
            },
            title: Text(dishes[index].name),
            subtitle: Text(dishes[index].time),
            trailing: Icon(Icons.keyboard_arrow_down),
          ),
        );
      }),
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