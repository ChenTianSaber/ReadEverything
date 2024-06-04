import 'package:get/get.dart';
import 'package:work/app/modules/image_viewer/image_viewer.binding.dart';

import '../modules/detail/detail.binding.dart';
import '../modules/detail/detail.view.dart';
import '../modules/detail/html/html.binding.dart';
import '../modules/detail/html/html.view.dart';
import '../modules/home/home.binding.dart';
import '../modules/home/home.view.dart';
import '../modules/image_viewer/image_viewer.view.dart';
import '../modules/sources/source_list/source_list.binding.dart';
import '../modules/sources/source_list/source_list.view.dart';
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
      children: [
        GetPage(
          name: _Paths.SOURCE_LIST,
          page: () => const SourceListView(),
          binding: SourceListBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
      children: [
        GetPage(
          name: _Paths.HTML,
          page: () => const HtmlView(),
          binding: HtmlBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.IMAGEVIEWER,
      page: () => const ImageViewerView(),
      binding: ImageViewerBinding(),
    ),
  ];
}
