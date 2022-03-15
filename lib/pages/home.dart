import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage = data['isDaytime'] ? 'daylightt.jpeg' : 'citylights.jpeg';
    Color? bgColor = data['isDaytime'] ? Colors.blue[300] : Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
                //this means that the image will cover the entire container (aka, screen) to fill up any empty spaces
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed:() async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']

                        };
    });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.white,
                    ),

                    label: Text(
                        'Edit Location',
                        style: TextStyle(
                        color: Colors.white,
                    )
                    ),
    ),
                  SizedBox(height:17.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 37.0,
                          letterSpacing: 1.3,
                          fontFamily: 'EB_Garamond',
                        ),
                       ),

                     ],
                    ),
                  SizedBox(height: 24.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 64.0,
                    )
                  ),
                 ]
                )
               ),
          )
            )
           );
          }

}
