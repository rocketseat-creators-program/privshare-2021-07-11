import 'package:get/get.dart';
import 'package:privshare/core/handlers/error_and_loader_state_handler.dart';
import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';
import 'package:privshare/modules/auth/repository/auth_repository.dart';
import 'package:privshare/modules/auth/repository/user_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ErrorAndLoaderStateHandler());

    Get.put<AppController>(
      AppController(
        Get.find(),
      ),
    );

    Get.put(UserRepository());
    Get.put(AuthRepository());

    Get.put<AuthController>(
      AuthController(
        appController: Get.find(),
        authRepository: Get.find(),
        userRepository: Get.find(),
      ),
    );
  }
}
