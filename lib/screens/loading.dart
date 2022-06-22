import 'package:flutter/material.dart';
import 'package:time_app/service/time_updater.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//author @ Aballey Wilson Wenawome

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void timeSetup() async {
    TimeUpdate instance = TimeUpdate(
        location: 'Toronto', flag: 'canada.png', url: 'America/Toronto');
    //await instance.date;
    await instance.getTime();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      },
    );
  }

  void initState() {
    super.initState();
    timeSetup();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: double.infinity,
        child: Image(
          image: AssetImage('assets/orsrc44213.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      Center(
        child: SpinKitRotatingCircle(
          color: Colors.lightBlue,
          size: 23,
        ),
      )
    ]);
  }
}
