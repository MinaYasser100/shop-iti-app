import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

class SerachInfoProductWidget extends StatelessWidget {
  const SerachInfoProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              'the product name for the user search on it',
              style: Styles.textStyle18.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              'Price : ',
              style: TextStyle(
                color: ConstantComponents.firstColor,
              ),
            ),
            const Text(
              '\$8488',
              style: Styles.textStyle20,
            ),
            const Text(
              'Old Price : ',
              style: TextStyle(
                color: ConstantComponents.firstColor,
              ),
            ),
            Text(
              '\$9988',
              style: Styles.textStyle20.copyWith(
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
