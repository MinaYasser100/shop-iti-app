import 'package:get/get.dart';
import 'package:shop_iti_app/features/details/presentation/views/product_details_view.dart';
import 'package:shop_iti_app/features/layout/presentation/views/layout_view.dart';
import 'package:shop_iti_app/user_handling/ui/onboarding/onboarding_ui.dart';
import 'package:shop_iti_app/user_handling/ui/pages/login_page.dart';
import 'package:shop_iti_app/user_handling/ui/pages/register_page.dart';
import 'package:shop_iti_app/features/search/presentation/views/search_view.dart';
import 'package:shop_iti_app/user_handling/ui/pages/settings/profile_data_page.dart';
import 'package:shop_iti_app/user_handling/ui/pages/settings/settings_page.dart';
import 'package:shop_iti_app/user_handling/ui/pages/settings/update_pass_page.dart';

abstract class GetPages {
  static String kOnboardingView = '/OnboardingView';
  static String kLayoutView = '/LayoutView';
  static String kProductDetails = '/ProductDetails';
  static String kSearchView = '/SearchView';
  static String kLoginView = '/LoginView';
  static String kRegisterView = '/RegisterView';
  static String kSettingsView = '/SettingsView';
  static String kProfileDataView = '/ProfileDataView';
  static String kUpdatePasswordView = '/UpdatePasswordView';
  static Transition ktransition = Transition.circularReveal;

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kOnboardingView,
      page: () => const Onbording(),
      transition: ktransition,
    ),

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

    GetPage(
      name: kSettingsView,
      page: () => const SettingsPage(),
      transition: ktransition,
    ),

    GetPage(
      name: kProfileDataView,
      page: () => const ProfileDataPage(),
      transition: ktransition,
    ),

    GetPage(
      name: kUpdatePasswordView,
      page: () => const UpdatePasswordPage(),
      transition: ktransition,
    ),
  ];
}
