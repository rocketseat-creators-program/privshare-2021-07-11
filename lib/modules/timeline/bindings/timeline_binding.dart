import 'package:get/get.dart';
import 'package:privshare/modules/timeline/controllers/timeline_controller.dart';
import 'package:privshare/modules/timeline/repositories/timeline_repository.dart';

class TimelineBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TimelineRepository());

    Get.lazyPut<TimelineController>(
      () => TimelineController(
        appController: Get.find(),
        timelineRepository: Get.find(),
      ),
    );
  }
}
