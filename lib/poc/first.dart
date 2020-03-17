import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstCalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zeta',
      home: Scaffold(
        body: PageView(
          // controller: controller,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            DayPage(title: "13 Maart"),
            DayPage(title: "Eergisteren"),
            DayPage(title: "Gisteren"),
            DayPage(title: "Vandaag"),
            DayPage(title: "Morgen"),
            DayPage(title: "Overmorgen"),
            DayPage(title: "19 Maart")
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search),
          backgroundColor: Color.fromRGBO(111, 88, 234, 1),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.list),
                iconSize: 40,
                color: Color.fromRGBO(111, 88, 234, 1),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 30,
                color: Color.fromRGBO(111, 88, 234, 0.5),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DayPage extends StatelessWidget {
  final String title;

  DayPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 60, 20, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.title,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(25, 28, 88, 1))),
            SizedBox(height: 10),
            Text("Vandaag, 16 maart",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(129, 131, 154, 1))),
            AppointmentCard(),
            AppointmentCard(),
            SizedBox(height: 30),
            Text("Morgen, 17 maart",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(129, 131, 154, 1))),
            AppointmentCard(),
            AppointmentCard(),
          ],
        ));
  }
}

class AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
              color: Color.fromRGBO(149, 142, 252, 1),
              width: 5.0,
            )),
            // borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color.fromRGBO(239, 239, 255, 1)),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Nederlands",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(25, 28, 88, 1)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "10:00 - 11.10",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(129, 131, 154, 1)),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(top: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                        child: Text(
                      "1",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(119, 112, 252, 1)),
                    ))))
          ],
        ),
      ),
    );
  }
}
