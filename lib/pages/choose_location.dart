import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Kuala Lumpur', flag: 'msia.webp'),
    WorldTime(url: 'Asia/Shanghai', location: 'Beijing', flag: 'beijing.jpeg'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.jpeg'),
    WorldTime(url: 'Asia/Manila', location: 'Manila', flag: 'manila.jpeg'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'tokyo.jpeg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.jpeg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.webp'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpeg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpeg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.webp'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpeg'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose Location'),
          elevation: 0.0
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )
            ),
          );
          }

      )

    );

      }
}
