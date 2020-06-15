import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final positioned;
  final callback;
  final map;
  final username;
  final firstName;
  final lastName;
  final phone;
  final pressed;

  const CardHome({
    @required this.positioned,
    @required this.callback,
    @required this.map,
    @required this.username,
    @required this.firstName,
    @required this.lastName,
    @required this.phone,
    @required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        map,
        Positioned(
          top: 0,
          right: 0,
          child: RaisedButton(
            color: Colors.black,
            child: Text(
              'Rastrear',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: pressed,
          ),
        ),
        AnimatedPositioned(
          curve: Curves.elasticOut,
          bottom: positioned,
          left: 0,
          right: 0,
          duration: Duration(milliseconds: 700),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            height: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: callback,
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  username,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  firstName,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  lastName,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  phone,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
