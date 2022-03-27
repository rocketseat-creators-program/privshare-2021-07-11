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
  final Rx<UserModel?> user = Rx(null);

  AuthController({
    required this.userRepository,
    required this.authRepository,
    required this.appController,
  });

  @override
  void onInit() {
    user.value = userRepository.getLocalUser();
    super.onInit();
  }

  bool isLoggedIn() => user.value != null;

  void subscribeToggle() {
    if (user.value != null) {
      user.update((user) {
        user!.isSubscriber = !user.isSubscriber;
      });

      userRepository.saveLocalUser(user.value!);

      if (user.value!.isSubscriber) {
        Get.defaultDialog(
          title: 'Obrigado por assinar!',
          middleText: 'Sejá bem vindo ao PrivShare',
        );
      }
    }
  }

  void logout() {
    userRepository.removeLocalUser();

    user.value = null;

    Get.offAllNamed(Routes.LOGIN);
  }

  login(String username, String password) async {
    appController.setIsLoading(true);

    try {
      // Mock de chamada a uma api (por exemplo)
      final _user = await authRepository.login(username, password);

      userRepository.saveLocalUser(_user);

      user.value = _user;

      appController.setIsLoading(true);

      Get.offAllNamed(Routes.TIMELINE);
    } on String catch (e) {
      appController.setErrorMessage(e);
    }
  }
}
