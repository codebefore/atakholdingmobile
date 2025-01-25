import 'dart:convert';
import 'package:atakholdingapp/models/client_model.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  int? id;
  int? customerId;
  String? email;
  String? name;
  String? phoneCode;
  String? phoneNumber;
  String? country;
  int? defaultClientId;
  String? refreshToken;
  String? roles;
  List<String>? roleList;
  ClientModel? defaultClient;
  UserModel({
    this.id,
    this.customerId,
    this.email,
    this.name,
    this.phoneCode,
    this.phoneNumber,
    this.country,
    this.defaultClientId,
    this.refreshToken,
    this.roles,
    this.roleList,
    this.defaultClient,
  });

  UserModel copyWith({
    int? id,
    int? customerId,
    String? email,
    String? name,
    String? phoneCode,
    String? phoneNumber,
    String? country,
    int? defaultClientId,
    String? refreshToken,
    String? roles,
    List<String>? roleList,
    ClientModel? defaultClient,
  }) {
    return UserModel(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      defaultClientId: defaultClientId ?? this.defaultClientId,
      refreshToken: refreshToken ?? this.refreshToken,
      roles: roles ?? this.roles,
      roleList: roleList ?? this.roleList,
      defaultClient: defaultClient ?? this.defaultClient,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    if (id != null) {
      result.addAll({'id': id});
    }
    if (customerId != null) {
      result.addAll({'customerId': customerId});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (phoneCode != null) {
      result.addAll({'phoneCode': phoneCode});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (defaultClientId != null) {
      result.addAll({'defaultClientId': defaultClientId});
    }
    if (refreshToken != null) {
      result.addAll({'refreshToken': refreshToken});
    }
    if (roles != null) {
      result.addAll({'roles': roles});
    }
    if (roleList != null) {
      result.addAll({'roleList': roleList});
    }
    if (defaultClient != null) {
      result.addAll({'defaultClient': defaultClient!.toMap()});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      customerId: map['customerId'],
      email: map['email'],
      name: map['name'],
      phoneCode: map['phoneCode'],
      phoneNumber: map['phoneNumber'],
      country: map['country'],
      defaultClientId: map['defaultClientId'],
      refreshToken: map['refreshToken'],
      roles: map['roles'],
      roleList: map['roles'].split(','),
      defaultClient: map['defaultClient'] != null
          ? ClientModel.fromMap(map['defaultClient'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id,customerId: $customerId, email: $email, name: $name, phoneCode: $phoneCode, phoneNumber: $phoneNumber, country: $country, defaultClientId: $defaultClientId, refreshToken: $refreshToken, roles: $roles, roleList: $roleList, defaultClient: $defaultClient)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.customerId == customerId &&
        other.email == email &&
        other.name == name &&
        other.phoneCode == phoneCode &&
        other.phoneNumber == phoneNumber &&
        other.country == country &&
        other.defaultClientId == defaultClientId &&
        other.refreshToken == refreshToken &&
        other.roles == roles &&
        listEquals(other.roleList, roleList) &&
        other.defaultClient == defaultClient;
  }

  @override
  int get hashCode {
    return customerId.hashCode ^
        email.hashCode ^
        id.hashCode ^
        name.hashCode ^
        phoneCode.hashCode ^
        phoneNumber.hashCode ^
        country.hashCode ^
        defaultClientId.hashCode ^
        refreshToken.hashCode ^
        roles.hashCode ^
        roleList.hashCode ^
        defaultClient.hashCode;
  }
}
