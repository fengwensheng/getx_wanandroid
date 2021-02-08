import 'package:get/get.dart';
import 'package:getx_wanandroid/app/common/server.dart';
import 'package:getx_wanandroid/app/modules/index/banners_model.dart';

class BannersProvider extends GetConnect {
  @override
  void onInit() {
    //通过 binding 中注入
    httpClient.defaultDecoder = (map) => Banners.fromJson(map);
    httpClient.baseUrl = BASE_URL;
  }

  //1
  // Future<Response<Banners>> getBanners() async => await get(
  //       '$BASE_URL/banner/json',
  //       decoder: (map) => Banners.fromJson(map),
  //     );
  //2
  Future<Response<Banners>> getBanners() async => await get('/banner/json');
  Future<Response<Banners>> postBanners(Banners banners) async =>
      await post('banners', banners);
  Future<Response> deleteBanners(int id) async => await delete('banners/$id');
}
