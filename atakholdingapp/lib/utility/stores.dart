import 'package:atakholdingapp/controllers/auth_controller.dart';
import 'package:atakholdingapp/controllers/loader_controller.dart';
import 'package:get/get.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  Future<void> dependencies() async {
    await Get.putAsync(() async => LoaderController(), permanent: true);
    await Get.putAsync(() async => AuthController(), permanent: true);
  }
}
