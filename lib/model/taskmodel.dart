import 'dart:convert';

class TaskModel {
  final String taskTitle;
  final String taskDescription;
  final String taskId;
  final String uploadedBy;
  final bool isDone;
  TaskModel({
    required this.taskTitle,
    required this.taskDescription,
    required this.taskId,
    required this.uploadedBy,
    required this.isDone,
  });

  TaskModel copyWith({
    String? taskTitle,
    String? taskDescription,
    String? taskId,
    String? uploadedBy,
    bool? isDone,
  }) {
    return TaskModel(
      taskTitle: taskTitle ?? this.taskTitle,
      taskDescription: taskDescription ?? this.taskDescription,
      taskId: taskId ?? this.taskId,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'taskTitle': taskTitle});
    result.addAll({'taskDescription': taskDescription});
    result.addAll({'taskId': taskId});
    result.addAll({'uploadedBy': uploadedBy});
    result.addAll({'isDone': isDone});
  
    return result;
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
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
    return 'TaskModel(taskTitle: $taskTitle, taskDescription: $taskDescription, taskId: $taskId, uploadedBy: $uploadedBy, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TaskModel &&
      other.taskTitle == taskTitle &&
      other.taskDescription == taskDescription &&
      other.taskId == taskId &&
      other.uploadedBy == uploadedBy &&
      other.isDone == isDone;
  }

  @override
  int get hashCode {
    return taskTitle.hashCode ^
      taskDescription.hashCode ^
      taskId.hashCode ^
      uploadedBy.hashCode ^
      isDone.hashCode;
  }
}
