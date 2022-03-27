import 'dart:convert';

import 'package:get/get_connect/http/src/http.dart';
import 'package:privshare/modules/timeline/models/timeline_item_model.dart';

class TimelineRepository {
  GetHttpClient http = GetHttpClient();

  List<TimelineItemModel> _postsDecoder(response) {
    final _response = json.decode(response) as List<dynamic>;

    return _response
        .map(
          (r) => TimelineItemModel.fromMap(r),
        )
        .toList();
  }

  Future<List<TimelineItemModel>> getPosts() async {
    final response = await http.get<List<TimelineItemModel>>(
      'http://o451q.mocklab.io/timeline/posts',
      decoder: _postsDecoder,
    );

    return response.body ?? [];
  }
}
