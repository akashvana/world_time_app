import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background image

    String bgImage = data['isDayTime'] ? 'day.jpg': 'night.jpg';
    Color bgcolor = data['isDayTime'] ? Colors.blue[100]: Colors.black87;
    Color textcolor = data['isDayTime'] ? Colors.black87: Colors.white;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null)
                    {
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag'],
                        };
                      });
                    }
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    color: textcolor,
                    ), 
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: textcolor,
                    ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                            color: textcolor,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: textcolor,
                      fontSize: 66.0,
                    ),
                  ),
              ],
            ),
          ),
        ),
        )

    );
  }
}