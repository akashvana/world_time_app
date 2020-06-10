import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    /*WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'gr.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'ke.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'kr.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'id.png'),
    WorldTime(url: 'Europe/Amsterdam', location: 'Amsterdam', flag: 'nl.png'),
    WorldTime(url: 'Europe/Helsinki', location: 'Helsinki', flag: 'fi.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'za.png'),
    WorldTime(url: 'America/Bogota', location: 'Bogota', flag: 'co.png'),
    WorldTime(url: 'America/Costa_Rica', location: 'Costa_Rica', flag: 'cr.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'cn.png'),
    WorldTime(url: 'Asia/Tokyo ', location: 'Tokyo', flag: 'jp.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'ru.png'),
    WorldTime(url: 'Europe/Oslo', location: 'Oslo', flag: 'no.png'),
    WorldTime(url: 'Africa/Tripoli', location: 'Tripoli', flag: 'ly.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'ng.png'),
    WorldTime(url: 'America/Havana', location: 'Havana', flag: 'cu.png'),
    WorldTime(url: 'America/Jamaica', location: 'Jamaica', flag: 'jm.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'ae.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'in.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'fr.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'it.png'),
    WorldTime(url: 'Africa/Tunis', location: 'Tunis', flag: 'tn.png'),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'gh.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico_City', flag: 'us.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'ca.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'sg.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'au.png'),
    */


    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),

  ];

  void updateTime(index) async{

    WorldTime instance = locations[index];
    await instance.getTime();
    
    //navigate to home screen

    Navigator.pop(context, {
      'location': instance.location, 
      'flag': instance.flag, 
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
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
              ),
            ),
          );
        },
      ),
    );
  }
}