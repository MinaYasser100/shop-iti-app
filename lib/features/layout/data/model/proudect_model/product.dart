
import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
class ProductItemModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  double? price;
  @HiveField(2)
  double? oldPrice;
  @HiveField(3)
  int? discount;
  @HiveField(4)
  String? image;
  @HiveField(5)
  String? name;
  @HiveField(6)
  String? description;
  @HiveField(7)
  List<dynamic>? images;
  @HiveField(8)
  bool? inFavorites;
  @HiveField(9)
  bool? inCart;


  ProductItemModel({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) =>
      ProductItemModel(
        id: json['id'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        oldPrice: (json['old_price'] as num?)?.toDouble(),
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'price': price,
    'old_price': oldPrice,
    'discount': discount,
    'image': image,
    'name': name,
    'description': description,
    'images': images,
    'in_favorites': inFavorites,
    'in_cart': inCart,
  };
}
