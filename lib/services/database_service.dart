import 'dart:convert';

import 'package:http/http.dart' as http;

class TaskApi {
  final String _url = "https://todo22a.herokuapp.com/api/v1/";
  postTask(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
  }

  getTask(getLink) async {
    var fullUrl = _url + getLink;
    return await http.get(Uri.parse(fullUrl));
  }
}
