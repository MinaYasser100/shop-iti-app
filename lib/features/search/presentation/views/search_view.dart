import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';
import 'package:shop_iti_app/features/search/presentation/manager/search_cubit.dart';
import 'package:shop_iti_app/features/search/presentation/views/func/search_app_bar.dart';
import 'package:shop_iti_app/features/search/presentation/views/widgets/search_body_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductItemModel> products = Get.arguments;
    return BlocProvider(
      create: (context) => SearchCubit(products),
      child: Scaffold(
        appBar: searchAppBar(),
        body: const SearchBodyView(),
      ),
    );
  }
}
