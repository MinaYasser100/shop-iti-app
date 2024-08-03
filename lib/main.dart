import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/core/pages/get_pages.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';
import 'package:shop_iti_app/features/layout/presentation/manager/layout_cubit/layout_screen_cubit.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/cart_item.dart';

import 'features/layout/presentation/views/widgets/shop/presentation/manager/shop_screen_cubit/shop_screen_cubit.dart';

void main() async {
  DioApi.initDio();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductItemModelAdapter());
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<ProductItemModel>(HiveHelper.productItemModelBox);
  await Hive.openBox<CartItem>(HiveHelper.cartBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutScreenCubit(),
        ),
        BlocProvider(
          create: (context) => ShopScreenCubit()..getShopData(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ConstantComponents.secondColor,
          colorScheme:
              ColorScheme.fromSeed(seedColor: ConstantComponents.firstColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: GetPages.kLayoutView,
        getPages: GetPages.getPages,
      ),
    );
  }
}
