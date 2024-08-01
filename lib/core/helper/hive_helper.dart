import 'package:hive/hive.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class HiveHelper {
  static const productItemModelBox = 'productItemModelBox';

  static Future<void> addFavoriteProduct(ProductItemModel product) async {
    final box = Hive.box<ProductItemModel>(productItemModelBox);
    await box.put(product.id, product);
  }

  static Future<void> removeFavoriteProduct(ProductItemModel product) async {
    final box = Hive.box<ProductItemModel>(productItemModelBox);
    await box.delete(product.id);
  }

  static List<ProductItemModel> getFavoriteProducts() {
    final box = Hive.box<ProductItemModel>(productItemModelBox);
    return box.values.toList();
  }

  static Future<void> delectAllFavProducts() async {
    final box = Hive.box<ProductItemModel>(productItemModelBox);
    await box.clear();
  }
}
