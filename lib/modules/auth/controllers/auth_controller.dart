import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privshare/core/routes/routes.dart';
import 'package:privshare/modules/auth/models/user_model.dart';
import 'package:privshare/modules/auth/repository/user_repository.dart';

class AuthController extends GetxController {
  final UserRepository repository;
  final Rx<UserModel?> user = Rx(null);

  AuthController(this.repository);

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

  void saveUser(UserModel _user) {
    repository.saveLocalUser(_user);

    user.value = _user;
  }

  void logout() {
    repository.removeLocalUser();

    user.value = null;

    Get.offAllNamed(Routes.LOGIN.path);
  }
}
