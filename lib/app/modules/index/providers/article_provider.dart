import 'package:get/get.dart';
import 'package:getx_wanandroid/app/common/server.dart';

import 'package:getx_wanandroid/app/modules/index/article_model.dart';

class ArticleProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Article.fromJson(map);
    httpClient.baseUrl = BASE_URL;
  }

  Future<Response<Article>> getArticles(int page) async =>
      await get('/article/list/$page/json');
  Future<Response<Article>> postArticle(Article article) async =>
      await post('article', article);
  Future<Response> deleteArticle(int id) async => await delete('article/$id');
}
