import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_wanandroid/app/modules/index/views/index_view.dart';

class HomeController extends GetxController {
  final navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.cube),
      label: '体系',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.briefcase),
      label: '项目',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: '我的',
    ),
  ];
  final subpages = [
    IndexView(),
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.purple),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
