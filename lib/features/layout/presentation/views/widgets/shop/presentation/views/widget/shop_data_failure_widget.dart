import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

class ShopDataFailureWidget extends StatelessWidget {
  const ShopDataFailureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Failed to load data',
              style: Styles.textStyle20Failure,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              FontAwesomeIcons.circleExclamation,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
