import 'datum.dart';

class FavData {
  num? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  num? perPage;
  dynamic prevPageUrl;
  num? to;
  num? total;

  FavData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory FavData.fromJson(Map<String, dynamic> json) => FavData(
        currentPage: json['current_page'] as num?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl: json['first_page_url'] as String?,
        from: json['from'] as num?,
        lastPage: json['last_page'] as num?,
        lastPageUrl: json['last_page_url'] as String?,
        nextPageUrl: json['next_page_url'] as dynamic,
        path: json['path'] as String?,
        perPage: json['per_page'] as num?,
        prevPageUrl: json['prev_page_url'] as dynamic,
        to: json['to'] as num?,
        total: json['total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };
}
