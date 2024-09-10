// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String email;
  final String id;
  final String firstname;
  final String lastname;
  final String password;
  final String token;
  final String type;
  final String address;
  final List<dynamic> cart;

  User(
      {required this.type,
      required this.address,
      required this.email,
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.password,
      required this.token,
      required this.cart});
  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'token': token,
      'password': password,
      'type': type,
      'address': address,
      'cart': cart
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
      type: map['type'] ?? '',
      address: map['address'] ?? '',
      cart: List<Map<String, dynamic>>.from(
          map['cart']?.map((x) => Map<String, dynamic>.from(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
  User copyWith({
    String? email,
    String? id,
    String? firstname,
    String? lastname,
    String? password,
    String? token,
    String? type,
    String? address,
    List<dynamic>? cart,
  }) {
    return User(
      email:email ?? this.email,
      id:id ?? this.id,
      firstname:firstname ?? this.firstname,
      lastname:lastname ?? this.lastname,
      password :password?? this.password,
      token:token ?? this.token,
      type:type ?? this.type,
      address:address ?? this.address,
      cart:cart ?? this.cart,
    );
  }
}
