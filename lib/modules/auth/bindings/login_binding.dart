import 'package:get/get.dart';
import 'package:privshare/modules/auth/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        appController: Get.find(),
        authController: Get.find(),
      ),
    );
  }
}
