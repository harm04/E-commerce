import 'dart:convert';

class User {
  final String email;
  final String id;
  final String name;
  final String password;
  final String token;

  User(
      {required this.email,
      required this.id,
      required this.name,
      required this.password,
      required this.token});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? token,
  }) {
    return User(
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
        password: password ?? this.password,
        token: token ?? this.token);
  }
}
