import 'package:get/get.dart';
import 'package:shop_iti_app/features/layout/presentation/views/layout_view.dart';

abstract class GetPages {
  static String kLayoutView = '/LayoutView';

  static Transition ktransition = Transition.leftToRight;

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kLayoutView,
      page: () => const LayoutView(),
      transition: ktransition,
    ),
  ];
}
