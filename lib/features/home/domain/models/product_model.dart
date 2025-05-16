class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  RatingModel? rating;
  String? image;
  List<String>? images;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.rating,
    this.image,
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        price: (json['price'] as num?)?.toDouble(),
        rating: json['rating'] != null
            ? RatingModel.fromJson(json['rating'])
            : null,
        image: json['image'],
        images: (json['images'] as List?)?.map((e) => e.toString()).toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'rating': rating?.toJson(),
        'image': image,
        'images': images,
      };
}

class RatingModel {
  final double? rate;
  final int? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: (json['rate'] as num?)?.toDouble(),
        count: (json['count'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
