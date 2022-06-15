// ignore_for_file: deprecated_member_use

//author @ Aballey Wilson Wenawome

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:time_app/service/time_updater.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {
  List<TimeUpdate> locations = [
    TimeUpdate(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    TimeUpdate(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    TimeUpdate(url: 'Africa/Accra', location: 'Accra', flag: 'ghana.png'),
    TimeUpdate(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    TimeUpdate(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    TimeUpdate(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    TimeUpdate(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),
    TimeUpdate(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    TimeUpdate(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void up_Time(index) async {
    TimeUpdate instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                  child: ListTile(
                onTap: () {
                  up_Time(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              )),
            );
          }),
    );
  }
}
