import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

Column shopProductsHeader() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.productHunt,
              color: ConstantComponents.firstColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'All Products',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
