class FavProduct {
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;

  FavProduct({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  factory FavProduct.fromJson(Map<String, dynamic> json) => FavProduct(
        id: json['id'] as num?,
        price: json['price'] as num?,
        oldPrice: json['old_price'] as num?,
        discount: json['discount'] as num?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
      };
}
