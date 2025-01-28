import 'package:atakholdingapp/controllers/auth_controller.dart';
import 'package:atakholdingapp/models/user_model.dart';
import 'package:atakholdingapp/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  final UserModel user;
  final AuthController authController;

  const HomeDrawer({
    super.key,
    required this.user,
    required this.authController,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF2563EB),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                user.firstName?.substring(0, 1).toUpperCase() ?? 'A',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2563EB),
                ),
              ),
            ),
            accountName: Text(
              '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            accountEmail: Text(
              user.email ?? '',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF64748B)),
            title: const Text(
              'Çıkış Yap',
              style: TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              authController.logout();
              Get.offAllNamed(Pages.login);
            },
          ),
        ],
      ),
    );
  }
}
