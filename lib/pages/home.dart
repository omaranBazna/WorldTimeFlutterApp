import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {'city': "City", 'time': "Time", 'isDayTime': true};

  void updateData(dynamic new_data) {
    try {
      setState(() {
        data = {
          'city': new_data['city'],
          'flag': '',
          'time': new_data['time'],
          'isDayTime': new_data['isDayTime']
        };
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    if (data['city'] == 'City') {
      var route = ModalRoute.of(context);
      if (route != null) {
        print(route.settings.arguments);
        if (route.settings.arguments != null) {
          data = route.settings.arguments as Map;
        }
      }
    }
    String bg = data['isDayTime']
        ? "https://i.ibb.co/F4HxWKg/day.png"
        : "https://i.ibb.co/LNYbtrL/night.png";

    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(bg), fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          children: [
            ElevatedButton.icon(
                icon: Icon(Icons.location_pin),
                onPressed: () async {
                  Navigator.pushNamed(context, '/location').then((dynamic res) {
                    updateData(res);
                  });
                },
                label: Text("Change Location")),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data['city'],
                    style: TextStyle(
                        fontSize: 28.0, letterSpacing: 2, color: Colors.white))
              ],
            ),
            SizedBox(height: 20),
            Text(data['time'],
                style: TextStyle(fontSize: 66, color: Colors.white))
          ],
        ),
      ),
    )));
  }
}
