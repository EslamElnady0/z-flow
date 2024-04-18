class UserModel {
  String email;
  String firstName = "";
  String lastName = "";
  String password;
  final String uid;
  UserModel(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.uid});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "uid": uid
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"],
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        password: json["password"],
        uid: json["uid"]);
  }
}
