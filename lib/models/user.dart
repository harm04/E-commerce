import 'dart:convert';

class User {
  final String email;
  final String id;
  final String firstname;
  final String lastname;
  final String password;
  final String token;

  User(
      {required this.email,
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.password,
      required this.token});
  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'token': token,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
  User copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    String? token,
  }) {
    return User(
        email: email ?? this.email,
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        token: token ?? this.token);
  }
}
