class UserModel {
  String email;
  String firstName = "";
  String lastName = "";
  final String uid;
  UserModel(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.uid});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "uid": uid
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"],
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        uid: json["uid"]);
  }
}
