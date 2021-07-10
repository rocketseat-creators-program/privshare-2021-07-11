import 'package:get/get.dart';
import 'package:privshare/core/routes/middlewares/is_not_logged_middleware.dart';
import 'package:privshare/modules/auth/pages/login_page.dart';
import 'package:privshare/modules/timeline/pages/timeline_page.dart';

// class Route {
//   final String name;
//   final String path;

//   const Route({
//     required this.name,
//     required this.path,
//   });
// }

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

  static List<GetPage> pages = [
    GetPage(
      // name: LOGIN.name,
      name: LOGIN,
      middlewares: [
        IsNotLoggedMiddlware(),
      ],
      page: () => LoginPage(
        controller: Get.find(),
      ),
    ),
    GetPage(
      name: TIMELINE,
      page: () => TimelinePage(
        controller: Get.find(),
      ),
    ),
  ];
}
