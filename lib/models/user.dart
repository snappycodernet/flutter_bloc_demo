import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int? id;
  final String? email;
  final String? username;
  final String? name;
  final String? phone;

  const User({this.id, this.email, this.username, this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id : json['id'],
      email : json['email'],
      username : json['username'],
      name : json['name'],
      phone : json['phone'],
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'email': email,
      'username': username,
      'name': name,
      'phone': phone,
    };
  }

  @override
  List<Object?> get props => [id, email, username, name, phone];
}