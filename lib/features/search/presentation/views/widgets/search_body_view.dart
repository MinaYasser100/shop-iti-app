import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

import 'search_item_product_widget.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

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
              decoration: InputDecoration(
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
            const Text(
              'Search Result : ',
              style: Styles.textStyles20First,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const SearchItemProductWidget(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 15,
            ),
          ],
        ),
      ),
    );
  }
}
