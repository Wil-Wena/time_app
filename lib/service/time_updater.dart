import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class TimeUpdate {
  late String location; //location of time to be updated
  late String time; //Time in the location
  late String flag; //Location Flag icon
  late String url; //Url for API endpoint
  //late String date; //Date of location
  late bool? isDayTime; //Checks if day or night
//author @ Aballey Wilson Wenawome

  TimeUpdate({
    required this.location,
    required this.url,
    required this.flag,
  });

  Future<void> getTime() async {
    try {
      //Making a request from the http API
      Response response = await get(
          Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
      Map m = jsonDecode(response.body);

      //get proerties
      String dateTime = m['utc_datetime'];

      //Caters for Countries with positive /negative offsets
      String offset = m['utc_offset'].substring(0, 3);

      //creating DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //date = DateFormat.yMMMEd().format(now);

      //Checking for day or Time
      isDayTime = now.hour > 5 && now.hour < 18;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error is: $e');
    }
  }
}
