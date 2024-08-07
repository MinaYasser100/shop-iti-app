import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

class EmptyFavoritesListWidget extends StatelessWidget {
  const EmptyFavoritesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No favorites items',
            style: Styles.textStyle24,
          ),
        ],
      ),
    );
  }
}
