import 'cart_item.dart';

class Data {
  List<CartItem>? cartItems;
  num? subTotal;
  num? total;

  Data({this.cartItems, this.subTotal, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: json['sub_total'] as num?,
        total: json['total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'cart_items': cartItems?.map((e) => e.toJson()).toList(),
        'sub_total': subTotal,
        'total': total,
      };
}
