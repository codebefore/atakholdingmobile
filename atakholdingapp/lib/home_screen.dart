import 'package:atakholdingapp/components/base_button.dart';
import 'package:atakholdingapp/components/base_wrapper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWrapper(
        body: BaseButton(
      text: "Logout",
      onTap: () => {},
    ));
  }
}
