import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/cart_item.dart';

class HiveHelper {
  static const productItemModelBox = 'productItemModelBox';
  static const cartBox = 'cartBox';
  static const tokenBox = 'tokenBox';
  static const _tokenKey = 'tokenKey';
  static const onboardingBox = 'onboardingBox';
  static const _onboardingKey = 'onboardingKey';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductItemModelAdapter());
    Hive.registerAdapter(CartItemAdapter());
    await Hive.openBox<ProductItemModel>(HiveHelper.productItemModelBox);
    await Hive.openBox<CartItem>(HiveHelper.cartBox);
    await Hive.openBox<bool>(HiveHelper.onboardingBox);
    await Hive.openBox<String>(HiveHelper.tokenBox);
  }

  static Future<void> addFavoriteProduct(ProductItemModel product) async {
    final box = Hive.box<ProductItemModel>(productItemModelBox);
    await box.put(product.id, product);
  }

  static Future<void> removeFavoriteProduct(int productId) async {
    final box = Hive.box<ProductItemModel>(productItemModelBox);
    await box.delete(productId);
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

  static String? getToken() => Hive.box<String>(tokenBox).get(_tokenKey);

  static Future<void> updateToken(String token) async =>
      await Hive.box<String>(tokenBox).put(_tokenKey, token);

  static Future<bool> canShowOnboarding() async {
    final res = Hive.box<bool>(onboardingBox).get(_onboardingKey) ?? true;
    await Hive.box<bool>(onboardingBox).put(_onboardingKey, false);
    return res;
  }

  static Future<void> resetOnboarding() async =>
      Hive.box<bool>(onboardingBox).delete(_onboardingKey);
}
