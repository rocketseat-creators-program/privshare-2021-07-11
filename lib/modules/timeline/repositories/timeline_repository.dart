import 'dart:convert';

import 'package:privshare/modules/timeline/models/timeline_item_model.dart';

class TimelineRepository {
  // GetHttpClient http = GetHttpClient();

  List<TimelineItemModel> postsDecoder(response) {
    final _response = json.decode(response) as List<dynamic>;

    return _response
        .map(
          (r) => TimelineItemModel.fromMap(r),
        )
        .toList();
  }

  Future<List<TimelineItemModel>> getPosts() async {
    // 'http://o451q.mocklab.io/timeline/posts',

    return [
      TimelineItemModel(
        text: 'Mensagem...',
        isSubscribersOnly: false,
      ),
      TimelineItemModel(
        text: 'Mensagem 2...',
        isSubscribersOnly: false,
      ),
      TimelineItemModel(
        text: 'Mensagem para assinantes...',
        isSubscribersOnly: true,
      ),
      TimelineItemModel(
        text: 'Mensagem 3...',
        isSubscribersOnly: false,
      ),
      TimelineItemModel(
        text: 'Mensagem 4...',
        isSubscribersOnly: false,
      ),
      TimelineItemModel(
        text: 'Mensagem para assinantes 2...',
        isSubscribersOnly: true,
      ),
      TimelineItemModel(
        text: 'Mensagem 5...',
        isSubscribersOnly: false,
      ),
      TimelineItemModel(
        text: 'Mensagem para assinantes 3...',
        isSubscribersOnly: true,
      ),
    ];
  }
}
