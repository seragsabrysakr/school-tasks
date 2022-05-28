import 'dart:convert';

class WorkerModel {
  final int id;
  final String name;
  final String jobtitle;
  final String image;
  final String mail;
  final String phone;
  WorkerModel({
    required this.id,
    required this.name,
    required this.jobtitle,
    required this.image,
    required this.mail,
    required this.phone,
  });

  WorkerModel copyWith({
    int? id,
    String? name,
    String? jobtitle,
    String? image,
    String? mail,
    String? phone,
  }) {
    return WorkerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      jobtitle: jobtitle ?? this.jobtitle,
      image: image ?? this.image,
      mail: mail ?? this.mail,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'jobtitle': jobtitle});
    result.addAll({'image': image});
    result.addAll({'mail': mail});
    result.addAll({'phone': phone});
  
    return result;
  }

  factory WorkerModel.fromMap(Map<String, dynamic> map) {
    return WorkerModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      jobtitle: map['jobtitle'] ?? '',
      image: map['image'] ?? '',
      mail: map['mail'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkerModel.fromJson(String source) => WorkerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WorkerModel(id: $id, name: $name, jobtitle: $jobtitle, image: $image, mail: $mail, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WorkerModel &&
      other.id == id &&
      other.name == name &&
      other.jobtitle == jobtitle &&
      other.image == image &&
      other.mail == mail &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      jobtitle.hashCode ^
      image.hashCode ^
      mail.hashCode ^
      phone.hashCode;
  }
}
