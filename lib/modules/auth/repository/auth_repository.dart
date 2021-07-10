import 'package:privshare/modules/auth/models/user_model.dart';

class AuthRepository {
  Future<UserModel> login(String username, String password) async {
    await Future.delayed(
      Duration(milliseconds: 300),
    );

    if (password != 'subscribed' && password != 'password') {
      throw 'Usuário e/ou senha estão incorretos';
    } else {
      return UserModel(
        username: username,
        isSubscriber: (password == 'subscribed'),
      );
    }
  }
}
