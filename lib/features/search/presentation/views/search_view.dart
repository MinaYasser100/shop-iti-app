import 'package:flutter/material.dart';
import 'package:shop_iti_app/features/search/presentation/views/func/search_app_bar.dart';
import 'package:shop_iti_app/features/search/presentation/views/widgets/search_body_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(),
      body: const SearchBodyView(),
    );
  }
}
