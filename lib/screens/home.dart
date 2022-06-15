// ignore_for_file: deprecated_member_use

//author @ Aballey Wilson Wenawome

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map info = {};

  @override
  Widget build(BuildContext context) {
    //Accessing info passed from load route
    info = info.isNotEmpty
        ? info
        : ModalRoute.of(context)?.settings.arguments as Map;
    print(info);

    //setting background Image
    String backGroundImage = info['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor =
        info['isDayTime'] ? Colors.blue : Color.fromARGB(255, 29, 108, 110);

    return Scaffold(
      /* appBar: AppBar(
        title: Text(
          'Wil Time',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
      ), */
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$backGroundImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () async {
                  //Selected location requires update of time, location, day it is and the flag.
                  dynamic m = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    info = {
                      'time': m['time'],
                      'location': m['location'],
                      'isDayTime': m['isDayTime'],
                      'flag': m['flag'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.blueGrey[800],
                ),
                label: Text(
                  'Choose a location',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueGrey[800]),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    info['location'],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                info['time'],
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
