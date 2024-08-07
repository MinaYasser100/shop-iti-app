import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';


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
          Icon(
            Icons.favorite_border,
            size: 100.0,
            color: ConstantComponents.firstColor,
          ),
          SizedBox(height: 20.0),
           Text(
            'No favorites items',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),

    );
  }
}
