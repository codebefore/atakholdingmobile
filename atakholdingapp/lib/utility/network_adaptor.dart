import 'dart:io';
import 'package:atakholdingapp/controllers/auth_controller.dart';
import 'package:atakholdingapp/endpoints.dart';
import 'package:atakholdingapp/models/base_response_model.dart';
import 'package:atakholdingapp/router/pages.dart';
import 'package:atakholdingapp/utility/singleton.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class NetworkAdaptor {
  //#region PRIVATE
  static String _buildUrl(String partUrl) {
    if (partUrl.startsWith('https')) return partUrl;
    return "http://195.33.210.90:9611$partUrl";
  }

  static Dio _getDio({bool withToken = false}) {
    final AuthController authcontroller = g.Get.find();
    GetStorage storage = getIt.get<GetStorage>();
    final Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*",
      'Accept': '*/*'
    };
    if (withToken) {
      String accessToken = authcontroller.token == ""
          ? storage.read("token")
          : authcontroller.token;
      headers["Authorization"] = "Bearer $accessToken";
    }
    Dio dio = getIt.get<Dio>();
    dio.options.contentType = "application/json";
    dio.options.headers.addAll(headers);

    return dio;
  }

  static Dio _getDioWithToken() {
    Dio dio = _getDio(withToken: true);
    GetStorage storage = getIt.get<GetStorage>();
    dio.interceptors
      ..clear()
      ..add(
        QueuedInterceptorsWrapper(
          onError: (error, handler) async {
            if (error.response?.statusCode == HttpStatus.unauthorized) {
              storage.remove("token");
              storage.remove("user");
              Get.to(Pages.login);
              // var options = error.response!.requestOptions;
              // var newToken = await _userRefreshToken();
              // if (newToken.isEmpty) return handler.next(error);
              // options.headers["Authorization"] = "Bearer $newToken";
              // dio.options = BaseOptions(
              //   baseUrl: options.baseUrl,
              //   contentType: options.contentType,
              //   connectTimeout: options.connectTimeout,
              //   extra: options.extra,
              //   followRedirects: options.followRedirects,
              //   headers: options.headers,
              //   listFormat: options.listFormat,
              //   maxRedirects: options.maxRedirects,
              //   method: options.method,
              //   queryParameters: options.queryParameters,
              //   receiveDataWhenStatusError: options.receiveDataWhenStatusError,
              //   receiveTimeout: options.receiveTimeout,
              //   requestEncoder: options.requestEncoder,
              //   responseDecoder: options.responseDecoder,
              //   responseType: options.responseType,
              //   sendTimeout: options.sendTimeout,
              //   validateStatus: options.validateStatus,
              // );
            }
            return handler.next(error);
          },
        ),
      );
    return dio;
  }

  static Future<String> _userRefreshToken() async {
    final AuthController authcontroller = g.Get.find();
    GetStorage storage = getIt.get<GetStorage>();
    var dio = _getDio();
    try {
      final response = await dio.post(
        _buildUrl(Endpoints.refresh),
        data: {
          "token": authcontroller.token == ""
              ? storage.read("token")
              : authcontroller.token
        },
      );
      final body = response.data;
      if (body != null) {
        return "";
      }
      return "";
    } catch (exception) {
      return "";
    }
  }

  //#endregion

  //#region METHODS
  static Future<BaseResponseModel> get(String partUrl,
      {bool withToken = false}) async {
    try {
      var dio = _getDioWithToken();
      var url = _buildUrl(partUrl);
      final response = await dio.get(url) as BaseResponseModel;
      return response;
    } catch (error) {
      return BaseResponseModel(success: false, message: "", data: null);
    }
  }

  static Future<BaseResponseModel> post(String partUrl,
      {bool withToken = false}) async {
    try {
      var dio = withToken == true ? _getDioWithToken() : _getDio();
      var url = _buildUrl(partUrl);

      final response = await dio.post(url);
      var result = BaseResponseModel(
          data: null, success: false, message: response.statusMessage);
      if (response.statusCode! < 250) {
        result = BaseResponseModel.fromMap(response.data);
      }
      return result;
    } catch (error) {
      return BaseResponseModel(success: false, message: "", data: null);
    }
  }
}
