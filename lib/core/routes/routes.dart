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
import 'package:privshare/modules/auth/repository/auth_repository.dart';
import 'package:privshare/modules/auth/repository/user_repository.dart';
import 'package:privshare/modules/timeline/controllers/timeline_controller.dart';
import 'package:privshare/modules/timeline/pages/timeline_page.dart';
import 'package:privshare/modules/timeline/repositories/timeline_repository.dart';

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

  static Map<String, Widget Function(BuildContext)> routes() {
    final appController = AppController(
      ErrorAndLoaderStateHandler(),
    );

    final authController = AuthController(
      appController: appController,
      authRepository: AuthRepository(),
      userRepository: UserRepository(),
    );

    return {
      LOGIN: (_) => LoginPage(
            controller: authController,
          ),
      TIMELINE: (_) => TimelinePage(
            authController: authController,
            timelineController: TimelineController(
              appController: appController,
              timelineRepository: TimelineRepository(),
            ),
          ),
    };
  }
}
