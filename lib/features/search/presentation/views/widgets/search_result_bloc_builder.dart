import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/search/presentation/manager/search_cubit.dart';

import 'search_result_list_view.dart';

class SearchResultBlocBuilder extends StatelessWidget {
  const SearchResultBlocBuilder({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(builder: (context, state) {
      if (state is SearchCubitSearchDataSuccess &&
          searchController.text != '') {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search Result : ',
              style: Styles.textStyles20First,
            ),
            const SizedBox(
              height: 10,
            ),
            SearchResultListView(
              resultProducts: state.resultProducts,
            ),
          ],
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              'Search Now For What You Want',
              style: Styles.textStyle20.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    });
  }
}
