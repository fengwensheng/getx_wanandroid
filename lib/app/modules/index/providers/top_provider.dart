import 'package:get/get.dart';
import 'package:getx_wanandroid/app/common/server.dart';

import 'package:getx_wanandroid/app/modules/index/top_model.dart';

class TopProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Top.fromJson(map);
    httpClient.baseUrl = BASE_URL;
  }

  Future<Response<Top>> getTops() async => await get('/article/top/json');
  Future<Response<Top>> postTop(Top top) async => await post('top', top);
  Future<Response> deleteTop(int id) async => await delete('top/$id');
}
