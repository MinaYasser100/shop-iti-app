import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/favorite/presentation/manager/favorite_cubit.dart';

class FavoriteItemWidget extends StatelessWidget {
  final String image;
  final num price;
  final String title;
  final int id;

  const FavoriteItemWidget({
    required this.image,
    required this.price,
    required this.title,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              height: 120,
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          SizedBox(
            height: 120,
            width: MediaQuery.sizeOf(context).width * 0.34,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
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
              context.read<FavoriteCubit>().addOrDeleteFavoriteInApi(id);
            },
            icon: const Icon(
              Icons.favorite,
              color: ConstantComponents.firstColor,
            ),
          ),
        ],
      ),
    );
  }
}
