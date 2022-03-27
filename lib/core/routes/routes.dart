import 'package:get/get.dart';
import 'package:privshare/core/routes/middlewares/is_logged_middleware.dart';
import 'package:privshare/core/routes/middlewares/is_not_logged_middleware.dart';
import 'package:privshare/modules/auth/pages/login_page.dart';
import 'package:privshare/modules/auth/pages/register_page.dart';
import 'package:privshare/modules/timeline/bindings/timeline_binding.dart';
import 'package:privshare/modules/timeline/pages/timeline_page.dart';

class Routes {
  static const LOGIN = 'login';
  static const REGISTER = 'register';
  static const TIMELINE = 'timeline';

  static final timelinePage = GetPage(
    name: TIMELINE,
    middlewares: [
      IsLoggedMiddleware(),
    ],
    page: () => TimelinePage(
      authController: Get.find(),
      timelineController: Get.find(),
    ),
    binding: TimelineBinding(),
  );

  static final loginPage = GetPage(
    name: LOGIN,
    middlewares: [
      IsNotLoggedMiddleware(),
    ],
    page: () => LoginPage(
      controller: Get.find(),
    ),
  );

  static final registerPage = GetPage(
    name: REGISTER,
    middlewares: [
      IsNotLoggedMiddleware(),
    ],
    page: () => RegisterPage(
      controller: Get.find(),
    ),
  );

  static List<GetPage> pages = [
    loginPage,
    registerPage,
    timelinePage,
  ];
}
