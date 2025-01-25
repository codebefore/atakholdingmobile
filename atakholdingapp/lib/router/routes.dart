import 'package:atakholdingapp/auth/login_screen.dart';
import 'package:atakholdingapp/home_screen.dart';
import 'package:atakholdingapp/middleware.dart';
import 'package:atakholdingapp/router/pages.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final List<GetPage> routes = [
  GetPage(name: Pages.login, page: () => const LoginScreen()),
  GetPage(
      name: Pages.home,
      page: () => const HomeScreen(),
      middlewares: [HomeMiddleware()]),
];
