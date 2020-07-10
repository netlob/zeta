import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zeta/utils/theme.dart';

class HomeworkCard extends StatelessWidget {
  final String title;
  final String desc;
  final String date;
  final bool important;

  HomeworkCard({this.title, this.desc, this.date, this.important});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 7),
      margin: EdgeInsets.only(bottom: 105, right: 20, top: 60),
      decoration: BoxDecoration(
        color: AppColors.themes[AppColors.theme]["homeworkBackground"],
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
      height: 135,
      width: 250,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.themes[AppColors.theme]
                          ["homeworkTitle"]),
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
                // SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            this.date,
                            style: TextStyle(
                                color: Color.fromRGBO(206, 206, 206, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: FlatButton(
                            color: AppColors.themes[AppColors.theme]
                                ["homeworkButton"],
                            child: Text(
                              "Afronden",
                              style: TextStyle(
                                  color: Color.fromRGBO(123, 96, 247, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                          ))
                    ])
              ],
            ),
          ),
          Visibility(
              visible: this.important,
              child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "20min",
                              style: TextStyle(
                                  color: Color.fromRGBO(206, 206, 206, 1)),
                            ),
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    // color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Center(
                                    child: Icon(Icons.notification_important,
                                        color:
                                            Color.fromRGBO(252, 112, 119, 1))))
                          ]))))
        ],
      ),
    );
  }
}
