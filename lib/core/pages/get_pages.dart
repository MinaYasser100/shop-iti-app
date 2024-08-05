import 'package:get/get.dart';
import 'package:shop_iti_app/features/details/presentation/views/product_details_view.dart';
import 'package:shop_iti_app/features/layout/presentation/views/layout_view.dart';
import 'package:shop_iti_app/login_register/ui/pages/login_page.dart';
import 'package:shop_iti_app/login_register/ui/pages/register_page.dart';
import 'package:shop_iti_app/features/search/presentation/views/search_view.dart';

abstract class GetPages {
  static String kLayoutView = '/LayoutView';
  static String kProductDetails = '/ProductDetails';
  static String kSearchView = '/SearchView';
  static String kLoginView = '/LoginView';
  static String kRegisterView = '/RegisterView';

  static Transition ktransition = Transition.circularReveal;

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kLayoutView,
      page: () => const LayoutView(),
      transition: ktransition,
    ),
    GetPage(
      name: kProductDetails,
      page: () => const ProductDetailsView(),
      transition: ktransition,
    ),
    GetPage(
      name: kSearchView,
      page: () => const SearchView(),
      transition: ktransition,
    ),
    GetPage(
      name: kLoginView,
      page: () => const LoginPage(),
      transition: ktransition,
    ),
    GetPage(
      name: kRegisterView,
      page: () => const RegisterPage(),
      transition: ktransition,
    ),
  ];
}
