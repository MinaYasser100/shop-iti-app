import 'package:hive/hive.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/cart_item.dart';

class HiveHelper {
  static const productItemModelBox = 'productItemModelBox';
  static const cartBox = 'cartBox';

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

  static Future<void> addProductToCart(CartItem product) async {
    final box = Hive.box<CartItem>(cartBox);
    await box.put(product.product!.id, product);
  }

  static Future<void> removeProductFromCart(int productId) async {
    final box = Hive.box<CartItem>(cartBox);
    await box.delete(productId);
  }

  static List<CartItem> getCartProducts() {
    final box = Hive.box<CartItem>(cartBox);
    return box.values.toList();
  }

  static Future<void> delectAllProductsFromCart() async {
    final box = Hive.box<CartItem>(cartBox);
    await box.clear();
  }
}
