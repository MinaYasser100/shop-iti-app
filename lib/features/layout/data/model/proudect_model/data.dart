import 'banner_model.dart';
import 'product.dart';

class Data {
  List<BannerModel>? banners;
  List<ProductItemModel>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => ProductItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        ad: json['ad'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'banners': banners?.map((e) => e.toJson()).toList(),
        'products': products?.map((e) => e.toJson()).toList(),
        'ad': ad,
      };
}
