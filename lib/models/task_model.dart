//this is the response from the api

class TaskModel {
  int? id;
  int? userId;
  String? todo;
  int? status;
  String? createdOn;

  TaskModel({this.id, this.userId, this.todo, this.status, this.createdOn});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    todo = json['todo'];
    status = json['status'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['todo'] = this.todo;
    data['status'] = this.status;
    data['created_on'] = this.createdOn;
    return data;
  }
}