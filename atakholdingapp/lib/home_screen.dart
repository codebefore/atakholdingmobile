import 'package:atakholdingapp/components/base_button.dart';
import 'package:atakholdingapp/components/base_wrapper.dart';
import 'package:atakholdingapp/controllers/auth_controller.dart';
import 'package:atakholdingapp/models/user_model.dart';
import 'package:atakholdingapp/router/pages.dart';
import 'package:atakholdingapp/utility/singleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token = "";
  UserModel user = new UserModel();
  GetStorage storage = getIt.get<GetStorage>();
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    token = storage.read("token");
    user = UserModel.fromJson(storage.read("user"));
    authController.setToken(token ?? "");
    authController.setUser(user);
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return BaseWrapper(
        body: Column(
      children: [
        Text(authController.user.firstName ?? ""),
        Text(authController.user.lastName ?? ""),
        Text(authController.token),
        BaseButton(
          text: "Logout",
          onTap: () => {
            authController.logout(),
            Get.offAllNamed(Pages.login),
          },
        ),
      ],
    ));
  }
}
