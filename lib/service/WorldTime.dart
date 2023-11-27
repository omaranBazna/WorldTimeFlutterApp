import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String content = "";

  String time = "";

  String flag = "";

  String city = "";

  bool isDayTime = false;

  WorldTime({required this.content, required this.flag, required this.city});

  Future<void> getData() async {
    try {
      var url =
          Uri.parse('https://worldtimeproxy.omranbazna.repl.co/$content/$city');

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      Map data = convert.jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("catch${e}");
    }
/*
    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body);
      print(data);
      var itemCount = data['totalItems'];

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now.add(Duration(hours: int.parse(offset)));
      print(now.toString());
      time = now.toString();
      print("done");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }*/
  }
}
