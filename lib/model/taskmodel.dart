import 'dart:convert';

class TaskModel {
    final int id;
  final String taskTitle;
  final String taskDescription;
  final String taskId;
  final String uploadedBy;
  final bool isDone;
  TaskModel({
    required this.id,
    required this.taskTitle,
    required this.taskDescription,
    required this.taskId,
    required this.uploadedBy,
    required this.isDone,
  });

  TaskModel copyWith({
    int? id,
    String? taskTitle,
    String? taskDescription,
    String? taskId,
    String? uploadedBy,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDescription: taskDescription ?? this.taskDescription,
      taskId: taskId ?? this.taskId,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'taskTitle': taskTitle});
    result.addAll({'taskDescription': taskDescription});
    result.addAll({'taskId': taskId});
    result.addAll({'uploadedBy': uploadedBy});
    result.addAll({'isDone': isDone});
  
    return result;
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toInt() ?? 0,
      taskTitle: map['taskTitle'] ?? '',
      taskDescription: map['taskDescription'] ?? '',
      taskId: map['taskId'] ?? '',
      uploadedBy: map['uploadedBy'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(id: $id, taskTitle: $taskTitle, taskDescription: $taskDescription, taskId: $taskId, uploadedBy: $uploadedBy, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TaskModel &&
      other.id == id &&
      other.taskTitle == taskTitle &&
      other.taskDescription == taskDescription &&
      other.taskId == taskId &&
      other.uploadedBy == uploadedBy &&
      other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      taskTitle.hashCode ^
      taskDescription.hashCode ^
      taskId.hashCode ^
      uploadedBy.hashCode ^
      isDone.hashCode;
  }
}
