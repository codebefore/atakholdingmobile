import 'package:atakholdingapp/components/base_button.dart';
import 'package:atakholdingapp/components/base_wrapper.dart';
import 'package:atakholdingapp/controllers/auth_controller.dart';
import 'package:atakholdingapp/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
