part of dnc_flutter_firestore_service;

class UserModel extends BaseModel {
  String name;
  String username;
  String email;
  String phone;

  UserModel(
      {this.name = "", this.username = "", this.email = "", this.phone = ""});

  factory UserModel.fromJson(dynamic map) {
    return UserModel(
        name: map["name"],
        username: map["username"],
        email: map["email"],
        phone: map["phone"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "username": username, "email": email, "phone": phone};
  }

  @override
  String toString() {
    return 'UserModel{name: $name, username: $username, email: $email, phone: $phone}';
  }
}
