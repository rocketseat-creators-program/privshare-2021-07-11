import 'package:get/get_connect/http/src/http.dart';
import 'package:privshare/core/constants/url.dart';
import 'package:privshare/modules/auth/models/user_model.dart';

class AuthRepository {
  GetHttpClient http = GetHttpClient();

  Future<UserModel> login(String username, String password) async {
    final response = await http.post(URLConstants.LOGIN,
        body: {'email': username, 'password': password});

    if (response.hasError) {
      throw 'Usuário e/ou senha estão incorretos';
    } else {
      return UserModel(
        username: username,
        isSubscriber: (password == 'subscribed'),
      );
    }
  }

  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      URLConstants.REGISTER,
      body: {
        'email': email,
        'name': username,
        'password': password,
      },
    );

    if (response.hasError) {
      throw 'Usuário já cadastrado';
    } else {
      return UserModel(
        username: username,
        isSubscriber: (password == 'subscribed'),
      );
    }
  }
}
