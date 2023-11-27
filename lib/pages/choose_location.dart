import 'package:flutter/material.dart';
import 'package:worldtime/service/WorldTime.dart';

class Choose_Location extends StatefulWidget {
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<Choose_Location> {
  List<WorldTime> locations = [
    WorldTime(content: "America", city: "Detroit", flag: ""),
    WorldTime(content: 'Europe', city: 'London', flag: 'uk.png'),
    WorldTime(content: 'Europe', city: 'Berlin', flag: 'greece.png'),
    WorldTime(content: 'Africa', city: 'Cairo', flag: 'egypt.png'),
    WorldTime(content: 'Africa', city: 'Nairobi', flag: 'kenya.png'),
    WorldTime(content: 'America', city: 'Chicago', flag: 'usa.png'),
    WorldTime(content: 'America', city: 'New_York', flag: 'usa.png'),
    WorldTime(content: 'Asia', city: 'Seoul', flag: 'south_korea.png'),
    WorldTime(content: 'Asia', city: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(int index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context, {
      'city': instance.city,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text("Choose Location"),
            centerTitle: true),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].city)));
          },
        ));
  }
}
