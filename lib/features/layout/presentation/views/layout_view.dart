import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

import 'func/naviagtion_item_button.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop App',
          style: TextStyle(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        decoration: const BoxDecoration(
          color: ConstantComponents.secondColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navigationItemButton(
              icon: FontAwesomeIcons.shop,
              onPressed: () {},
            ),
            navigationItemButton(
              icon: FontAwesomeIcons.solidHeart,
              onPressed: () {},
            ),
            navigationItemButton(
              icon: FontAwesomeIcons.cartShopping,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
