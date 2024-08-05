import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

class SearchImageWidget extends StatelessWidget {
  const SearchImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const Image(
          fit: BoxFit.fill,
          height: 190,
          width: 140,
          image: NetworkImage(
              'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?uid=R147359636&ga=GA1.1.1784309676.1714236600&semt=sph'),
        ),
        Container(
          height: 30,
          width: 140,
          decoration: const BoxDecoration(
            color: ConstantComponents.firstColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
            ),
          ),
          child: const Text(
            '  Discount',
            style: Styles.textStyle20White,
          ),
        )
      ],
    );
  }
}
