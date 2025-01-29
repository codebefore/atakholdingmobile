import 'package:atakholdingapp/router/pages.dart';
import 'package:atakholdingapp/router/routes.dart';
import 'package:atakholdingapp/utility/color_palette.dart';
import 'package:atakholdingapp/utility/singleton.dart';
import 'package:atakholdingapp/utility/size_config.dart';
import 'package:atakholdingapp/utility/stores.dart';
import 'package:atakholdingapp/utility/translator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //IF_NEEDED => CERTIFICATE
  // ByteData data = await PlatformAssetBundle()
  //     .load('lib/assets/images/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(data.buffer.asUint8List());

  // CALLING NATIVE CODE
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await singleton();
  await StoreBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    sizeConfig(context);
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: GetMaterialApp(
          getPages: routes,
          translations: Translator(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          title: 'Persan',
          theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
          darkTheme:
              ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          themeMode: ThemeMode.light,
          initialRoute: Pages.home,
          debugShowCheckedModeBanner: false,
          onReady: () => {},
        ));
  }
}
