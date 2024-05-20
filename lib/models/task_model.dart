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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['todo'] = todo;
    data['status'] = status;
    data['created_on'] = createdOn;
    return data;
  }
}