import 'dart:convert';

class User {

  final String name;
  final String email;
  final String hashedPassword;
  final DateTime timestamp;

  User({

    required this.name,
    required this.email,
    required this.hashedPassword,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {

      'name': name,
      'email': email,
      'hashedPassword': hashedPassword,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // map to obj
  factory User.fromMap(Map<String, dynamic> map) {
    return User(

      name: map['name'] ?? '',
      email: map['email'] ?? '',
      hashedPassword: map['hashedPassword'] ?? '',
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  // JSON
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
