import 'package:get/get.dart';

import 'package:getx_wanandroid/app/modules/home/controllers/home_controller.dart';
import 'package:getx_wanandroid/app/modules/index/controllers/index_controller.dart';
import 'package:getx_wanandroid/app/modules/index/providers/article_provider.dart';
import 'package:getx_wanandroid/app/modules/index/providers/banners_provider.dart';
import 'package:getx_wanandroid/app/modules/index/providers/top_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<IndexController>(() => IndexController());
    Get.lazyPut<BannersProvider>(() => BannersProvider());
    Get.lazyPut<TopProvider>(() => TopProvider());
    Get.lazyPut<ArticleProvider>(() => ArticleProvider());
  }
}
