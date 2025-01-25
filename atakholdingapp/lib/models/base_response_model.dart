import 'dart:convert';

class BaseResponseModel {
  final bool? success;
  final dynamic data;
  final String? message;
  final int? count;
  BaseResponseModel({
    this.success,
    required this.data,
    this.message,
    this.count,
  });

  BaseResponseModel copyWith({
    bool? success,
    dynamic data,
    String? message,
    int? count,
  }) {
    return BaseResponseModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (success != null) {
      result.addAll({'success': success});
    }
    result.addAll({'data': data});
    if (message != null) {
      result.addAll({'message': message});
    }
    if (count != null) {
      result.addAll({'count': count});
    }

    return result;
  }

  factory BaseResponseModel.fromMap(Map<String, dynamic> map) {
    return BaseResponseModel(
      success: map['success'],
      data: map['data'],
      message: map['message'],
      count: map['count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseResponseModel.fromJson(String source) =>
      BaseResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BaseResponseModel(success: $success, data: $data, message: $message, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseResponseModel &&
        other.success == success &&
        other.data == data &&
        other.message == message &&
        other.count == count;
  }

  @override
  int get hashCode {
    return success.hashCode ^ data.hashCode ^ message.hashCode ^ count.hashCode;
  }
}
