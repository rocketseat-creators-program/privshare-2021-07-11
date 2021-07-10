import 'dart:convert';

class UserModel {
  final String username;
  bool isSubscriber;

  UserModel({
    required this.username,
    required this.isSubscriber,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'isSubscriber': isSubscriber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      isSubscriber: map['isSubscriber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
