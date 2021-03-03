import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:getx_wanandroid/app/modules/index/banners_model.dart' as banner;
import 'package:getx_wanandroid/app/modules/index/controllers/index_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_wanandroid/app/modules/index/top_model.dart' as top;
import 'package:getx_wanandroid/app/routes/app_pages.dart';
import 'package:getx_wanandroid/app/widgets/space_header.dart';

import '../article_model.dart';

class IndexView extends GetView<IndexController> {
  @override
  Widget build(_) => Scaffold(
        body: SafeArea(
          child: Obx(
            () => Column(
              children: [
                _buildBanners(controller.banners),
                _buildArticles(controller.tops, controller.articles),
              ],
            ),
          ),
        ),
      );

  Widget _buildBanners(List<banner.Data> banners) => SizedBox(
        height: Get.height / 4,
        child: Swiper(
          itemCount: banners.length,
          itemBuilder: (_, i) => Image.network(
            '${banners[i].imagePath}',
            fit: BoxFit.cover,
          ),
          autoplay: true,
          pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            builder: RectSwiperPaginationBuilder(
              activeSize: Size(50.w, 20.w),
              size: Size(20.w, 20.w),
              activeColor: Colors.blue,
              color: Colors.grey,
            ),
          ),
        ),
      );

  Widget _buildArticles(List<top.Data> tops, List<Datas> articles) => Expanded(
        child: EasyRefresh(
          onRefresh: controller.reset,
          onLoad: controller.getArticles,
          header: SpaceHeader(),
          child: ListView.separated(
            itemBuilder: (_, i) => _buildArticle(i, tops, articles),
            separatorBuilder: (_, i) => Divider(),
            itemCount: tops.length + articles.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
          ),
        ),
      );

  Widget _buildArticle(int i, List<top.Data> tops, List<Datas> articles) =>
      InkWell(
        onTap: () {
          final link =
              i < tops.length ? tops[i].link : articles[i - tops.length].link;
          Get.toNamed(Routes.ARTICLE_DETAIL, arguments: link);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                i < tops.length
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: Border.all(
                            color: Colors.red[900],
                          ),
                        ),
                        child: Text(
                          '置顶',
                          style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(width: 20.w),
                Text(
                  i < tops.length
                      ? '${tops[i].author}'
                      : '${articles[i - tops.length].author}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),
                Text(
                  i < tops.length
                      ? '${tops[i].niceDate}'
                      : '${articles[i - tops.length].niceDate}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            Text(
              i < tops.length
                  ? '${tops[i].title}'
                  : '${articles[i - tops.length].title}',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  i < tops.length
                      ? '${tops[i].superChapterName}/'
                      : '${articles[i - tops.length].superChapterName}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  i < tops.length
                      ? '${tops[i].chapterName}'
                      : '${articles[i - tops.length].chapterName}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  ///end
}
