import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getx_wanandroid/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(_) => CupertinoTabScaffold(
        tabBuilder: (_, i) => controller.subpages[i],
        tabBar: CupertinoTabBar(items: controller.navBarItems),
      );

  ///end
}
