import 'package:get/get.dart';
import 'package:privshare/modules/auth/controllers/user_controller.dart';
import 'package:privshare/modules/timeline/pages/timeline_page.dart';

class IsNotLoggedMiddlware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    final userCtrl = Get.find<UserController>();

    return userCtrl.isLoggedIn()
        ? GetPage(
            name: 'timeline',
            page: () => TimelinePage(
              controller: Get.find(),
            ),
          )
        : page;
  }
}
