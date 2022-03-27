import 'package:privshare/modules/app/controllers/app_controller.dart';
import 'package:privshare/modules/timeline/models/timeline_item_model.dart';
import 'package:privshare/modules/timeline/repositories/timeline_repository.dart';

class TimelineController {
  final AppController appController;
  final TimelineRepository timelineRepository;
  List<TimelineItemModel> posts = [];

  TimelineController({
    required this.appController,
    required this.timelineRepository,
  }) {
    getPosts();
  }

  getPosts() async {
    appController.setIsLoading(true);

    posts = await timelineRepository.getPosts();

    appController.setIsLoading(false);
  }
}
