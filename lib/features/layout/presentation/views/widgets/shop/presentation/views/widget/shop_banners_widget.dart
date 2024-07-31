import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/banner_model.dart';

class ShopBannersWidget extends StatelessWidget {
  const ShopBannersWidget({
    super.key,
    required this.banners,
  });

  final List<BannerModel>? banners;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners!.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(banner.image ?? '', fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 180.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 3,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOutBack,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
