import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/auth/models/user_model.dart';
import 'package:privshare/modules/auth/repository/user_repository.dart';

class AuthController {
  final UserRepository repository;
  final AppController appController;
  late UserModel? user;

  AuthController({
    required this.repository,
    required this.appController,
  }) {
    user = repository.getLocalUser();
  }

  bool isLoggedIn() => user != null;

  void subscribeToggle() {
    if (user != null) {
      user!.isSubscriber = !user!.isSubscriber;

      repository.saveLocalUser(user!);

      if (user!.isSubscriber) {}
    }
  }

  void logout() {
    repository.removeLocalUser();

    user = null;

    // Navigate LOGIN
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

      user = _user;

      appController.setIsLoading(false);

      // Navigate TIMELINE
    }
  }
}
