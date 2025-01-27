import 'dart:convert';

class UserModel {
  int? id;
  int? customerId;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phoneNumber;
  String? country;
  UserModel(
      {this.id,
      this.customerId,
      this.email,
      this.firstName,
      this.lastName,
      this.phoneCode,
      this.phoneNumber,
      this.country});

  UserModel copyWith(
      {int? id,
      int? customerId,
      String? email,
      String? firstName,
      String? lastName,
      String? phoneCode,
      String? phoneNumber,
      String? country}) {
    return UserModel(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneCode: phoneCode ?? this.phoneCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        country: country ?? this.country);
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
    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
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

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        customerId: map['customerId'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        phoneCode: map['phoneCode'],
        phoneNumber: map['phoneNumber'],
        country: map['country']);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id,customerId: $customerId, email: $email, firstName: $firstName, lastName: $lastName, phoneCode: $phoneCode, phoneNumber: $phoneNumber, country: $country, ';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.customerId == customerId &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneCode == phoneCode &&
        other.phoneNumber == phoneNumber &&
        other.country == country;
  }

  @override
  int get hashCode {
    return customerId.hashCode ^
        email.hashCode ^
        id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneCode.hashCode ^
        phoneNumber.hashCode ^
        country.hashCode;
  }
}
