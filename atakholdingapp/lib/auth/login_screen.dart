import 'package:atakholdingapp/components/base_button.dart';
import 'package:atakholdingapp/components/base_input.dart';
import 'package:atakholdingapp/components/base_wrapper.dart';
import 'package:atakholdingapp/components/spacer.dart';
import 'package:atakholdingapp/controllers/auth_controller.dart';
import 'package:atakholdingapp/controllers/loader_controller.dart';
import 'package:atakholdingapp/models/user_model.dart';
import 'package:atakholdingapp/router/pages.dart';
import 'package:atakholdingapp/utility/check_local_auth.dart';
import 'package:atakholdingapp/utility/enums.dart';
import 'package:atakholdingapp/utility/singleton.dart';
import 'package:atakholdingapp/utility/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.find<AuthController>();
  final loaderController = Get.find<LoaderController>();
  var emailtextcontroller = TextEditingController();
  var passwordtextcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GetStorage storage = getIt.get<GetStorage>();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool obsecurePassword = true;
  bool hideLoginElements = false;
  String? token = "";
  UserModel user = new UserModel();
  @override
  void initState() {
    super.initState();
    token = storage.read("token");
    if (token == null)
      hideLoginElements = false;
    else {
      checkbio();
      hideLoginElements = true;
    }
  }

  Future<void> checkbio() async {
    final hasPermission = await checkBiometrics();
    if (hasPermission) {
      final bool authenticated = await authenticateUser();
      if (authenticated) {
        user = UserModel.fromJson(storage.read("user"));
        authController.setToken(token ?? "");
        authController.setUser(user);
        Get.offAllNamed(Pages.home);
      }
    }
  }

  Future<void> validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      loaderController.setStatus(Status.loading);
      var isSuccess = await authController.login();
      // form?.reset();
      if (isSuccess == true) {
        loaderController.setStatus(Status.success);
        await Get.offAllNamed(Pages.home);
      } else {
        loaderController.setStatus(Status.error);
        Get.snackbar("Error", "checkyourcredentials".tr,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 5),
            icon: const Icon(Icons.error, color: Colors.red),
            overlayColor: Colors.black,
            colorText: Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWrapper(
        body: Form(
      key: _formKey,
      child: hideLoginElements == true
          ? Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Hide Login Elements")],
            )
          : Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo,
                emailArea,
                spacer(),
                passwordArea,
                spacer(),
                loginButton,
                signUpButton
              ],
            ),
    ));
  }

  BaseButton get signUpButton => BaseButton(
        text: "signup".tr,
        onTap: () => {},
        bgColor: Colors.transparent,
        textColor: Theme.of(context).colorScheme.primary,
      );

  BaseInput get emailArea => BaseInput(
        controller: emailtextcontroller,
        focusNode: emailFocus,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          labelText: 'email'.tr,
          hintText: 'enter_email'.tr,
          prefixIcon: Icon(Icons.person,
              size: screenWidth * .005, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          emailFocus.unfocus();
          FocusScope.of(context).requestFocus(passwordFocus);
        },
        onChanged: (String value) {
          authController.loginModel.email = value;
          authController.setLoginModel(authController.loginModel);
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );

  BaseButton get loginButton => BaseButton(
        text: "login".tr,
        onTap: validateAndSave,
        width: screenWidth,
      );

  BaseInput get passwordArea => BaseInput(
        controller: passwordtextcontroller,
        focusNode: passwordFocus,
        obsecure: obsecurePassword,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obsecurePassword = !obsecurePassword;
                });
              },
              child: obsecurePassword == true
                  ? Icon(
                      Icons.visibility_off_sharp,
                      color: Theme.of(context).primaryColor,
                      size: screenWidth * .005,
                    )
                  : Icon(
                      Icons.visibility,
                      color: Theme.of(context).primaryColor,
                      size: screenWidth * .005,
                    )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          labelText: "password".tr,
          hintText: "enter_password".tr,
          prefixIcon: Icon(Icons.lock,
              size: screenWidth * .005, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.text,
        textFormatters: const [],
        textInputAction: TextInputAction.done,
        onEditingComplete: () {
          passwordFocus.unfocus();
        },
        onChanged: (String value) {
          authController.loginModel.password = value;
          authController.setLoginModel(authController.loginModel);
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );
  Container get logo => Container(
        height: screenHeight * .18,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/persanlogo.png'),
          ),
        ),
      );
}
