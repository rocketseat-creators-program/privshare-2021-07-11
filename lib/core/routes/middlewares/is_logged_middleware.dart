import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privshare/core/routes/routes.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';

class IsLoggedMiddleware extends GetMiddleware {
  late AuthController _authController;

  @override
  RouteSettings? redirect(String? route) {
    _authController = Get.find();

    return _authController.isLoggedIn()
        ? null
        : RouteSettings(name: Routes.LOGIN);
  }
}
