import 'package:get/get.dart';
import 'package:privshare/core/routes/routes.dart';
import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';
import 'package:privshare/modules/auth/models/user_model.dart';

class LoginController extends GetxController {
  final AuthController authController;
  final AppController appController;

  LoginController({
    required this.authController,
    required this.appController,
  });

  login(String username, String password) async {
    appController.setIsLoading(true);

    await Future.delayed(
      Duration(milliseconds: 300),
    );

    if (password != 'subscribed' && password != 'password') {
      appController.setErrorMessage('Usuário e/ou senha estão incorretos');
    } else {
      final user = UserModel(
        username: username,
        isSubscriber: (password == 'subscribed'),
      );

      authController.saveUser(user);

      appController.setIsLoading(false);

      Get.offAllNamed(Routes.DASHBOARD.path);
    }
  }
}
