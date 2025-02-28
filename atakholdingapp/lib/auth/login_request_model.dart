import 'dart:convert';

class LoginRequestModel {
  String? email = "gokhangozen";
  String? password = "ozlenen";
  LoginRequestModel({
    this.email,
    this.password,
  });

  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (email != null) {
      result.addAll({'email': email});
    }
    if (password != null) {
      result.addAll({'password': password});
    }

    return result;
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRequestModel(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginRequestModel &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
