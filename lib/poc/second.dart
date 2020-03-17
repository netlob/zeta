import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:zeta/splash.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondCalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zeta',
        home: Container(
            color: Color.fromRGBO(90, 109, 246, 1),
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                body: Container(
                  color: Color.fromRGBO(243, 244, 249, 1),
                  child: Stack(
                    children: <Widget>[
                      ClipPath(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(90, 109, 246, 1)),
                            height: 260),
                        clipper: BottomWaveClipper(),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.transparent,
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.search, color: Colors.white),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(35, 40, 20, 10), // T: 130
                          child: Row(children: <Widget>[
                            Column(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Vandaag",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text("17 maart 2020",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ]),
                            // Icon(Icons.arrow_drop_down, color: Colors.white)
                          ])),
                      Container(
                          margin: EdgeInsets.only(top: 90),
                          height: 280,
                          child: _buildCarousel(context)
                          // Row(children: <Widget>[
                          //   HomeworkCard(
                          //     title: "Huiswerk",
                          //     desc: "Nederlands Oefen SE af",
                          //   ),
                          //   SizedBox(width: 20),
                          //   HomeworkCard(
                          //     title: "Proefwerk",
                          //     desc: "Duits Oefen SE af",
                          //   ),
                          // ])
                          ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 340, 0, 0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "WOE",
                              style: TextStyle(color: Colors.black26),
                            ),
                            Text(
                              "12",
                              style: TextStyle(
                                  color: Color.fromRGBO(123, 96, 247, 1),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 330,
                        margin: EdgeInsets.fromLTRB(70, 325, 0, 0),
                        child: Column(
                          children: <Widget>[
                            AppointmentCard(
                              title: "Nederlands",
                              hour: "1",
                            ),
                            AppointmentCard(
                              title: "Geschiedenis",
                              hour: "2",
                            ),
                            Divider(),
                            AppointmentCard(
                              title: "Aardrijkskunde",
                              hour: "4",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 675, 0, 0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "DON",
                              style: TextStyle(color: Colors.black26),
                            ),
                            Text(
                              "13",
                              style: TextStyle(
                                  color: Color.fromRGBO(86, 84, 104, 1),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 330,
                        margin: EdgeInsets.fromLTRB(70, 670, 0, 0),
                        child: Column(
                          children: <Widget>[
                            AppointmentCard(
                              title: "Wiskunde A",
                              hour: "1",
                            ),
                            // AppointmentCard(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.search),
                  backgroundColor: Color.fromRGBO(252, 202, 46, 1),
                  onPressed: () {},
                ),
                bottomNavigationBar: BottomAppBar(
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _buildCarousel(BuildContext context) {
    final classes = [
      "Nederlands",
      "Aardrijkskunde",
      "Wiskunde B",
      "Geschiedenis",
      "Scheikunde"
    ];
    final tasks = [
      "Oefen SE afmaken",
      "H1 + H2 maken",
      "Nakijken H5",
      "Doorlezen §2",
      "Practicum af"
    ];
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex) {
        return HomeworkCard(
          title: classes[itemIndex],
          desc: tasks[itemIndex],
        );
      },
    );
  }
}

class HomeworkCard extends StatelessWidget {
  final String title;
  final String desc;

  HomeworkCard({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 12),
      margin: EdgeInsets.only(bottom: 90, right: 20, top: 60),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 50.0,
            spreadRadius: 1.0,
            offset: Offset(
              10.0,
              10.0,
            ),
          )
        ],
      ),
      height: 130,
      width: 250,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(90, 89, 103, 1)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.desc,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(129, 131, 154, 1)),
                ),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      color: Color.fromRGBO(243, 242, 248, 1),
                      child: Text(
                        "Afronden",
                        style: TextStyle(
                            color: Color.fromRGBO(123, 96, 247, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                    ))
              ],
            ),
          ),
          // Align(
          //     alignment: Alignment.topRight,
          //     child: Container(
          //         height: 40,
          //         width: 40,
          //         margin: EdgeInsets.only(top: 15, right: 15),
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius:
          //                 BorderRadius.all(Radius.circular(50))),
          //         child: Center(
          //             child: Text(
          //           "1",
          //           style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //               color: Color.fromRGBO(119, 112, 252, 1)),
          //         ))))
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String title;
  final String hour;

  AppointmentCard({this.title, this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black12,
                      //     blurRadius: 50.0,
                      //     spreadRadius: .1,
                      //     offset: Offset(
                      //       10.0,
                      //       10.0,
                      //     ),
                      //   )
                      // ],
                    ),
                    // decoration: BoxDecoration(
                    //     border: Border(
                    //         left: BorderSide(
                    //       color: Color.fromRGBO(149, 142, 252, 1),
                    //       width: 5.0,
                    //     )),
                    //     color: Color.fromRGBO(239, 239, 255, 1)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                this.title,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(90, 89, 103, 1)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "10:00 - 11.10",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(226, 226, 226, 1)),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Center(
                                    child: Text(
                                  this.hour,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(119, 112, 252, 1)),
                                ))))
                      ],
                    ),
                  ),
                ))));
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 8), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 60);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
