import 'package:hive/hive.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? quantity;
  @HiveField(2)
  ProductItemModel? product;

  CartItem({this.id, this.quantity, this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : ProductItemModel.fromJson(
                json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product?.toJson(),
      };
}
