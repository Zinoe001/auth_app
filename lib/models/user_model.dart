class UserModel {
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.pin,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String pin;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"].toString(),
        pin: json["pin"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "phone": phone,
        "pin": pin,
      };
}
