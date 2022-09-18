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

  final cardMargin = 7.5;

  List<Dish> dishes = [
    Dish(name: "Köttfärssås och spaghetti", time: "20 min", desc: "Favoritmat nummer ett! Alla - oavsett ålder - älskar spagetti och köttfärssås! Här är ett smakfullt och pålitligt recept som du lyckas med. Servera gärna med riven parmesanost."),
    Dish(name: "Panerad torsk med potatismos", time: "15 min", desc: "Fisk är både gott och nyttigt! Extra smarrig blir fisken med en god panering och ett krämigt mos till. Servera med kokt broccoli som fortfarande får behålla lite krispighet och lite citron att pressa på toppen."),
    Dish(name: "Risotto m. svamp och tomat", time: "30 min", desc: "En riktigt krämig risotto med goda smaker av svamp, spenat och tomat. Följ det här receptet och du har alla chanser att lyckas med en perfekt kokt risotto med stor krämighet och det perfekta lilla tuggmotståndet. När du lärt dig grunden är det lätt att variera din risotto med andra smaker."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
    Dish(name: "Äppelpaj m. vaniljsås", time: "30-40 min", desc: "En klassisk knäckig äppelpaj passar alltid som ett sött avslut på middagen."),
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
      body: Container(
        margin: EdgeInsets.fromLTRB(cardMargin * 2, cardMargin, cardMargin * 2, cardMargin * 6),
        child: ListView.builder(
          itemCount: dishes.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
          return Card(
            color: colorWhite,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: ExpansionTile(
              title: Text(dishes[index].name, style: TextStyle(color: colorGray, fontFamily: "Roboto",),),
              subtitle: Text(dishes[index].time, style: TextStyle(color: colorGray, fontFamily: "Roboto",),),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishes[index].desc,
                      style: TextStyle(
                        color: colorGray,
                        fontFamily: "Roboto",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/edit",
                          arguments: Dish(
                            name: dishes[index].name,
                            time: dishes[index].time,
                            desc: dishes[index].desc,
                          ),
                        );
                      },
                      child: Icon(
                        Icons.edit,
                        size: 26.0,
                        color: colorGray,
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        minimumSize: Size(26.0, 26.0),
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
                //TODO: Forsätt med implementering av expanderade brickor. T.ex. ikonerna!
                //TODO: Se även till att bli av med fula gråa linjerna som dyker upp vid expandering.
              ],
              textColor: colorGray,
              iconColor: colorGray,
              collapsedTextColor: colorGray,
              collapsedIconColor: colorGray,
              tilePadding: EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 2.0),
              childrenPadding: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 12.0),
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


/* SKRÄPKOMMENTERAD KOD NEDANFÖR */


//ElevatedButton(
//  onPressed: () {
//    Navigator.pushNamed(context, "/add");
//  },
//  child: Icon(Icons.add),
//  style: ElevatedButton.styleFrom(
//    shape: CircleBorder(),
//    primary: colorBlue,



/*
  child: ExpansionPanelList(
  children: [
    ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ExpansionTile(
          children: [
            Text("Undertext."),
          ],
          title: Text(
            dishes[0].name,
            style: TextStyle(
              color: colorGray,
              fontFamily: "Roboto",
            ),
          ),
          subtitle: Text(
            dishes[0].time,
            style: TextStyle(
              color: colorGray,
              fontFamily: "Roboto-Bold",
            ),
          ),
        );
      },
      body: Text("Här finns info om maträtten!"),
      isExpanded: expanded[0],
      canTapOnHeader: true,
    ),
    ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            dishes[1].name,
            style: TextStyle(
              color: colorGray,
              fontFamily: "Roboto",
            ),
          ),
          subtitle: Text(
            dishes[1].time,
            style: TextStyle(
              color: colorGray,
              fontFamily: "Roboto-Bold",
            ),
          ),
        );
      },
      body: Text("Här finns info om maträtten!"),
      isExpanded: expanded[1],
      canTapOnHeader: true,
    ),
  ],
  expansionCallback: (int i, bool isExpanded) {
    setState(() {
      expanded[i] = !isExpanded;
    });
  }
),
*/


/*
ListView.builder(
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
}),*/