import 'package:get/get.dart';
import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/timeline/models/timeline_item_model.dart';
import 'package:privshare/modules/timeline/repositories/timeline_repository.dart';

class TimelineController extends GetxController {
  final AppController appController;
  final TimelineRepository timelineRepository;
  RxList<TimelineItemModel> posts = RxList();

  TimelineController({
    required this.appController,
    required this.timelineRepository,
  });

  @override
  void onReady() {
    getPosts();
    super.onReady();
  }

  getPosts() {
    appController.setIsLoading(true);

    posts.value = timelineRepository.getPosts();

    appController.setIsLoading(false);
  }
}
