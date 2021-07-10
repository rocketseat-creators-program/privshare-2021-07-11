import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privshare/core/routes/routes.dart';
import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/auth/models/user_model.dart';
import 'package:privshare/modules/auth/repository/user_repository.dart';

class AuthController extends GetxController {
  final UserRepository repository;
  final AppController appController;
  final Rx<UserModel?> user = Rx(null);

  AuthController({
    required this.repository,
    required this.appController,
  });

  @override
  void onInit() {
    user.value = repository.getLocalUser();
    super.onInit();
  }

  bool isLoggedIn() => user.value != null;

  void subscribeToggle() {
    if (user.value != null) {
      user.update((user) {
        if (user != null) {
          user.isSubscriber = !user.isSubscriber;
        }
      });

      repository.saveLocalUser(user.value!);

      if (user.value!.isSubscriber) {
        Get.snackbar(
          'Seja bem vindo!',
          'Você agora é um assinante do privshare.',
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void logout() {
    repository.removeLocalUser();

    user.value = null;

    // Get.offAllNamed(Routes.LOGIN.path);
    Get.offAllNamed(Routes.LOGIN);
  }

  login(String username, String password) async {
    appController.setIsLoading(true);

    await Future.delayed(
      Duration(milliseconds: 300),
    );

    if (password != 'subscribed' && password != 'password') {
      appController.setErrorMessage('Usuário e/ou senha estão incorretos');
    } else {
      final _user = UserModel(
        username: username,
        isSubscriber: (password == 'subscribed'),
      );

      repository.saveLocalUser(_user);

      user.value = _user;

      appController.setIsLoading(false);

      // Get.offAllNamed(Routes.DASHBOARD.path);
      Get.offAllNamed(Routes.TIMELINE);
    }
  }
}
