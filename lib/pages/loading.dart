import 'package:flutter/material.dart';
import 'package:worldtime/service/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void stepUpWorldTime() async {
    WorldTime instance =
        WorldTime(content: "America", flag: "", city: "detroit");
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'city': instance.city,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stepUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[800],
        body: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ));
  }
}
