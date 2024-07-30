import 'package:flutter/material.dart';

import 'func/shop_app_bar.dart';

class ShopBodyView extends StatelessWidget {
  const ShopBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          shopAppBar(),
        ],
      ),
    );
  }
}
