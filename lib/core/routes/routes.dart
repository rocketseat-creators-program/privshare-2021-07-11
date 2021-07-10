// class Route {
//   final String name;
//   final String path;

//   const Route({
//     required this.name,
//     required this.path,
//   });
// }

import 'package:flutter/material.dart';
import 'package:privshare/core/handlers/error_and_loader_state_handler.dart';
import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/auth/controllers/auth_controller.dart';
import 'package:privshare/modules/auth/pages/login_page.dart';
import 'package:privshare/modules/auth/repository/user_repository.dart';

class Routes {
  // static const LOGIN = Route(
  //   name: 'login',
  //   path: 'login',
  // );

  // static const DASHBOARD = Route(
  //   name: 'dashboard',
  //   path: 'dashboard',
  // );

  static const LOGIN = 'login';
  static const TIMELINE = 'timeline';

  static final Map<String, Widget Function(BuildContext)> routes = {
    LOGIN: (_) => LoginPage(
          controller: AuthController(
            appController: AppController(
              ErrorAndLoaderStateHandler(),
            ),
            repository: UserRepository(),
          ),
        ),
  };
}
