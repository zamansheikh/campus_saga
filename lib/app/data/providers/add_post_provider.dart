import 'package:get/get.dart';

import '../models/add_post_model.dart';

class AddPostProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return AddPost.fromJson(map);
      if (map is List)
        return map.map((item) => AddPost.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<AddPost?> getAddPost(int id) async {
    final response = await get('addpost/$id');
    return response.body;
  }

  Future<Response<AddPost>> postAddPost(AddPost addpost) async =>
      await post('addpost', addpost);
  Future<Response> deleteAddPost(int id) async => await delete('addpost/$id');
}
