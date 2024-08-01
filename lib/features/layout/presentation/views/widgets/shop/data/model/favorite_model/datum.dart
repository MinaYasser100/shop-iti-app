import 'fav_product.dart';

class Datum {
  num? id;
  FavProduct? product;

  Datum({this.id, this.product});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : FavProduct.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };
}
