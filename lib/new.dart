import 'package:flutter/material.dart';

class Address extends StatelessWidget {



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("Saved Adresses")),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.red[500],
                      ),
                      Text('41'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
