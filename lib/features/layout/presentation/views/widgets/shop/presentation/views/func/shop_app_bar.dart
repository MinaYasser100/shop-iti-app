import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

Row shopAppBar() {
  return Row(
    children: [
      const Expanded(
        child: Text(
          'Find Your Product here...',
          style: Styles.textStyle30,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Container(
        height: 70,
        decoration: BoxDecoration(
          color: ConstantComponents.firstColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(22),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ),
    ],
  );
}
