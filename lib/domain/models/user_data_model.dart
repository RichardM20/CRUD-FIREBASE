class UserDataModel {
  final String? id;
  final String? email;

  UserDataModel({
    this.id,
    this.email,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json["uid"] ?? "",
      email: json['email'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
