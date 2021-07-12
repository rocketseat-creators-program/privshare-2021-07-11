import 'package:get/get.dart';
import 'package:privshare/core/routes/routes.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';

class IsNotLoggedMiddlware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    final AuthController authController = Get.find();

    return authController.isLoggedIn() ? Routes.timelinePage : page;
  }
}
