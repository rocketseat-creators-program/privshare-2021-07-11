import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:privshare/core/handlers/error_and_loader_state_handler.dart';
import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';
import 'package:privshare/modules/auth/repository/user_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(
      AppController(
        ErrorAndLoaderStateHandler(),
      ),
    );

    Get.put<GetStorage>(GetStorage());
    Get.put<UserRepository>(
      UserRepository(
        Get.find(),
      ),
    );

    Get.lazyPut<AuthController>(
      () => AuthController(
        appController: Get.find(),
        repository: Get.find(),
      ),
    );
  }
}
