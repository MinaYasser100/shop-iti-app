class BannerModel {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  BannerModel({this.id, this.image, this.category, this.product});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'] as int?,
        image: json['image'] as String?,
        category: json['category'] as dynamic,
        product: json['product'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'category': category,
        'product': product,
      };
}
