import 'package:flutter/material.dart';

import 'search_image_widget.dart';
import 'search_info_product_widget.dart';

class SearchItemProductWidget extends StatelessWidget {
  const SearchItemProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const SearchImageWidget(),
        ),
        const SizedBox(
          width: 10,
        ),
        const SerachInfoProductWidget()
      ],
    );
  }
}
