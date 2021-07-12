import 'package:get/get.dart';
import 'package:privshare/core/routes/routes.dart';
import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/auth/models/user_model.dart';
import 'package:privshare/modules/auth/repository/auth_repository.dart';
import 'package:privshare/modules/auth/repository/user_repository.dart';

class AuthController extends GetxController {
  final UserRepository userRepository;
  final AuthRepository authRepository;
  final AppController appController;
  late UserModel? user;

  AuthController({
    required this.userRepository,
    required this.authRepository,
    required this.appController,
  });

  @override
  void onInit() {
    user = userRepository.getLocalUser();
    super.onInit();
  }

  bool isLoggedIn() => user != null;

  void subscribeToggle() {
    if (user != null) {
      user!.isSubscriber = !user!.isSubscriber;

      userRepository.saveLocalUser(user!);

      if (user!.isSubscriber) {}
    }
  }

  void logout() {
    userRepository.removeLocalUser();

    user = null;

    Get.offAllNamed(Routes.LOGIN);
  }

  login(String username, String password) async {
    appController.setIsLoading(true);

    try {
      // Mock de chamada a uma api (por exemplo)
      final _user = await authRepository.login(username, password);

      userRepository.saveLocalUser(_user);

      user = _user;

      appController.setIsLoading(false);

      Get.offAllNamed(Routes.TIMELINE);
    } on String catch (e) {
      appController.setErrorMessage(e);
    }
  }
}
