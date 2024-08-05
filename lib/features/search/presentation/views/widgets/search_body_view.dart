import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/features/search/presentation/manager/search_cubit.dart';

import 'search_result_bloc_builder.dart';

class SearchBodyView extends StatefulWidget {
  const SearchBodyView({super.key});

  @override
  State<SearchBodyView> createState() => _SearchBodyViewState();
}

class _SearchBodyViewState extends State<SearchBodyView> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                context
                    .read<SearchCubit>()
                    .searchForProdcute(searchController.text);
              },
              decoration: InputDecoration(
                hintText: 'Search here...',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SearchResultBlocBuilder(
              searchController: searchController,
            ),
          ],
        ),
      ),
    );
  }
}
