import 'package:flutter/material.dart';

// 卡片
void main(List<String> args) {
  runApp(new MaterialApp(title: 'TextAPP', home: new Home()));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
        height: 600,
        width: 440,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myTitle(),
              subTitle(),
              stars(),
              iconLists(),
            ],
          ),
        ),
      )),
    );
  }
}

Widget iconLists() {
  final descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
    height: 2,
  );

  Widget allList(IconData icon, String label, String timer) {
    return Column(
      children: [
        Icon(icon, color: Colors.green[500]),
        Text(label),
        Text(timer),
      ],
    );
  }

  return DefaultTextStyle.merge(
    style: descTextStyle,
    child: Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          allList(Icons.kitchen, 'PREP:', '25 min'),
          allList(Icons.timer, 'COOK:', '1 hr'),
          allList(Icons.restaurant, 'FEEDS:', '4-6'),
        ],
      ),
    ),
  );
}

Widget stars() {
  return Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.black),
            Icon(Icons.star, color: Colors.black),
          ],
        ),
        Text(
          '170 Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}

Widget myTitle() {
  return Container(
    padding: EdgeInsets.all(20),
    child: Text(
      'Strawberry Pavlova',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
        fontSize: 30,
      ),
    ),
  );
}

Widget subTitle() {
  return Container(
      child: Text(
    'Pavlova is a meringue-based dessert named after the Russian ballerina '
    'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
    'topped with fruit and whipped cream.',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: 'Georgia',
      fontSize: 25,
    ),
  ));
}
