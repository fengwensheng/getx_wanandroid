import 'package:get/get.dart';

import 'package:getx_wanandroid/app/modules/home/bindings/home_binding.dart';
import 'package:getx_wanandroid/app/modules/home/views/home_view.dart';
import 'package:getx_wanandroid/app/modules/index/articleDetail/bindings/article_detail_binding.dart';
import 'package:getx_wanandroid/app/modules/index/articleDetail/views/article_detail_view.dart';
import 'package:getx_wanandroid/app/modules/index/bindings/index_binding.dart';
import 'package:getx_wanandroid/app/modules/index/views/index_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INDEX,
      page: () => IndexView(),
      binding: IndexBinding(),
      children: [
        GetPage(
          name: _Paths.ARTICLE_DETAIL,
          page: () => ArticleDetailView(),
          binding: ArticleDetailBinding(),
        ),
      ],
    ),
  ];
}
