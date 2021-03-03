import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_wanandroid/app/modules/index/article_model.dart'
    as article;
import 'package:getx_wanandroid/app/modules/index/banners_model.dart';
import 'package:getx_wanandroid/app/modules/index/providers/article_provider.dart';
import 'package:getx_wanandroid/app/modules/index/providers/banners_provider.dart';
import 'package:getx_wanandroid/app/modules/index/providers/top_provider.dart';
import 'package:getx_wanandroid/app/modules/index/top_model.dart' as top;

class IndexController extends GetxController {
  final banners = List<Data>.empty(growable: true).obs;
  final tops = List<top.Data>.empty(growable: true).obs;
  final articles = List<article.Datas>.empty(growable: true).obs;
  final _bannersProvider = Get.find<BannersProvider>();
  final _topProvider = Get.find<TopProvider>();
  final _articleProvider = Get.find<ArticleProvider>();
  final page = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getBanners();
    getTops();
    getArticles();
  }

  void getBanners() {
    _bannersProvider.getBanners().then((resp) {
      banners.assignAll(resp.body.data);
    }, onError: (e) {
      Get.snackbar('ERROR', e.toString());
    });
  }

  void getTops() {
    _topProvider.getTops().then((resp) {
      tops.assignAll(resp.body.data);
    }, onError: (e) {
      Get.snackbar('ERROR', e.toString(), colorText: Colors.red);
    });
  }

  Future<void> getArticles() async {
    //for reset
    if ((page.value == 0) && (articles.isNotEmpty)) articles.clear();
    try {
      Response<article.Article> resp =
          await _articleProvider.getArticles(page.value);
      articles.addAll(resp.body.data.datas);
      page.value++;
    } catch (e) {
      Get.snackbar('ERROR', e.toString(), colorText: Colors.red);
    }
  }

  Future<void> reset() async {
    page.value = 0;
    await getArticles();
  }
}
