import 'package:get/get.dart';

import 'app/modules/add_post/bindings/add_post_binding.dart';
import 'app/modules/add_post/views/add_post_page.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/home_page.dart';
import 'app/modules/profile/bindings/profile_binding.dart';
import 'app/modules/profile/views/profile_page.dart';
import 'app/modules/promotion/bindings/promotion_binding.dart';
import 'app/modules/promotion/views/promotion_page.dart';
import 'app/modules/ranking/bindings/ranking_binding.dart';
import 'app/modules/ranking/views/ranking_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/promotion',
      page: () => PromotionPage(),
      binding: PromotionBinding(),
    ),
    GetPage(
      name: '/add_post',
      page: () => AddPostPage(),
      binding: AddPostBinding(),
    ),
    GetPage(
      name: '/ranking',
      page: () => RankingPage(),
      binding: RankingBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
