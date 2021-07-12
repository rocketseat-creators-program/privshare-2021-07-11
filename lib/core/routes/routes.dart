import 'package:get/get.dart';
import 'package:privshare/modules/auth/pages/login_page.dart';
import 'package:privshare/modules/timeline/bindings/timeline_binding.dart';
import 'package:privshare/modules/timeline/pages/timeline_page.dart';

class Routes {
  static const LOGIN = 'login';
  static const TIMELINE = 'timeline';

  static final timelinePage = GetPage(
    name: TIMELINE,
    page: () => TimelinePage(
      authController: Get.find(),
      timelineController: Get.find(),
    ),
    binding: TimelineBinding(),
  );

  static List<GetPage> pages = [
    GetPage(
      name: LOGIN,
      page: () => LoginPage(
        controller: Get.find(),
      ),
    ),
    timelinePage,
  ];
}
