

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  final String id;
  final String name;
  final String email;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["user_id"].toString(),
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": id,
        "name": name,
        "email": email,
      };
}
