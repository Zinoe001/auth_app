

class UserModel {
  UserModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["user_id"].toString(),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": id,
        "name": name,
      };
}
