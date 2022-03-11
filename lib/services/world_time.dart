import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  String? location; //location name
  String? time; //time in tha location
  String? flag; //url to an asset flag icon
  String? url;  //location url for API

  WorldTime({required this.location, required this.flag, required this.url});

  void getTime() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(datetime);
    //print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));


    time = now.toString();
  }

  }
  WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');