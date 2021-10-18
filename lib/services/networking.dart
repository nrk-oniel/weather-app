import 'package:http/http.dart';
import 'dart:convert';
import 'dart:core';

// int getTime = Duration(seconds: time.elapsedMicroseconds).inMicroseconds;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    var urlParse = Uri.parse(url);
    Response response = await get(urlParse);
    if (response.statusCode == 200) {
      print('Got the URL');
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Failed to Gather Data');
    }
  }
}
