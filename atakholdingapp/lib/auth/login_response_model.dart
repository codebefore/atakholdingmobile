import 'dart:convert';

import 'package:atakholdingapp/models/user_model.dart';

class LoginResponseModel {
  String? token;
  UserModel? user;
  LoginResponseModel({
    this.token,
    this.user,
  });

  LoginResponseModel copyWith({
    String? token,
    UserModel? user,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (token != null) {
      result.addAll({'token': token});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }

    return result;
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'],
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponseModel(token: $token, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponseModel &&
        other.token == token &&
        other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}
