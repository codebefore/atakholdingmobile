import 'package:atakholdingapp/router/pages.dart';
import 'package:atakholdingapp/utility/singleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    GetStorage storage = getIt.get<GetStorage>();
    String? token = storage.read("token");
    if (token == null || token.isEmpty) {
      return const RouteSettings(name: Pages.login);
    } else {
      return null;
    }
  }
}
