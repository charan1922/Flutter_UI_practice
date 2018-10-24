import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        softWrap: true,
        style: TextStyle(fontSize: 15.0),
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Layout")),
      body: ListView(
        children: <Widget>[
          new Image.asset(
            'images/lake.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          textSection,
          buttonSection
        ],
      ),
    );
  }
}
