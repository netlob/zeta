import 'package:flutter/material.dart';
import 'package:zeta/pages/settings/settings.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 6.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            iconSize: 30,
            color: Color.fromRGBO(111, 88, 234, 1),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            iconSize: 20,
            color: Color.fromRGBO(111, 88, 234, 0.5),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 20,
            color: Color.fromRGBO(111, 88, 234, 0.5),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
        ],
      ),
    );
  }
}
