import 'package:flutter/material.dart';
import 'package:http/http.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter =1;



  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose Location'),
          elevation: 0.0
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {
            counter +=1;
          });
        },
        child: Text('counter is $counter'),
      )

        );

      }
}