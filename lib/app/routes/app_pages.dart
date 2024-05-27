import 'package:get/get.dart';

import '../modules/home/home.binding.dart';
import '../modules/home/home.view.dart';
import '../modules/sources/sources.binding.dart';
import '../modules/sources/sources.view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SOURCES,
      page: () => const SourcesView(),
      binding: SourcesBinding(),
    ),
  ];
}
