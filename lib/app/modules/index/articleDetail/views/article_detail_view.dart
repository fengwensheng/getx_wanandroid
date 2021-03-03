import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/article_detail_controller.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  final link = Get.arguments;
  @override
  Widget build(_) => SafeArea(
        child: WebView(
          onWebViewCreated: (_) => Get.dialog(CupertinoActivityIndicator()),
          onPageStarted: (_) {},
          onPageFinished: (_) => Get.back(),
          initialUrl: link,
        ),
      );
}
