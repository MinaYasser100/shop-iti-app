

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

class FavoriteBodyView extends StatefulWidget {
  const FavoriteBodyView({super.key});

  @override
  _FavoriteBodyViewState createState() => _FavoriteBodyViewState();
}

class _FavoriteBodyViewState extends State<FavoriteBodyView> {
  List<Map<String, dynamic>> favorites = [
    {
      'image': 'https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwc6d5bdfe/nk/9bc/0/1/6/b/c/9bc016bc_cd7a_49cc_a399_47930b00c59f.jpg?sw=700&sh=700&sm=fit&q=100&strip=false',
      'price': 29.99,
      'title': 'Nike Dunk Low Retro',
    },
    {
      'image': 'https://telfonak.com/wp-content/uploads/2024/02/iphone15-plus.webp',
      'price': 950.0,
      'title': 'Apple iPhone 15 Plus',
    },
  ];

  void _removeItem(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantComponents.firstColor,
        title: Text(
          'My Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: favorites
            .asMap()
            .entries
            .map((entry) => buildFavItem(
          image: entry.value['image'],
          price: entry.value['price'],
          title: entry.value['title'],
          index: entry.key,
        ))
            .toList(),
      ),
    );
  }

  Widget buildFavItem({
    required String image,
    required double price,
    required String title,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '\$ $price',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _removeItem(index);
            },
            icon: Icon(
              Icons.favorite,
              color:ConstantComponents.firstColor,
            ),
          ),
        ],
      ),
    );
  }
}

