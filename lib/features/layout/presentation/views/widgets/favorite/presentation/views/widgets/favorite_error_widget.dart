import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

class FavoriteErrorWidget extends StatelessWidget {
  const FavoriteErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'An error occurred while fetching data',
          style: Styles.textStyle20Failure,
        ),
      ],
    );
  }
}
