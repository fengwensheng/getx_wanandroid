import 'dart:io';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailController extends GetxController {
  final loading = true.obs;
  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
