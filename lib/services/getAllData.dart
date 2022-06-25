import 'dart:convert';

import '../shared_constants/components.dart';
import 'database_service.dart';

class GetAllData {}

Future<void> getAllTask() async {
  //link //https://todo22a.herokuapp.com/api/v1/task/
  //expected body:  "id": 394,
  //         "user_id": 4,
  //         "todo": "",
  //         "status": 0,
  //         "created_on": "2022-06-23T20:24:25.000Z"
  var res = await TaskApi().getTask('task/');
  var body = jsonDecode(res.body);
  print('THis is the body: ${body[0]}');
  if (res.statusCode == 200) {
    print('Response was successful');
  }
  final List data = [
    TaskComponent(
        taskCategory: 'Personal',
        taskTitle: '${body[0][2]}',
        taskTime: '09:00 - 10:30')
  ];

//write api code here
}
