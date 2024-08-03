class Product {
  final int id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String> tags;
  final String? brand;
  final String? sku;
  final double? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String> images;
  final String? thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        title: json['title'],
        description: json['description'],
        category: json['category'],
        price: json['price'] == null ? null : double.parse(json['price'].toString()),
        discountPercentage: json['discountPercentage'] == null ? null : double.parse(json['discountPercentage'].toString()),
        rating: json['rating'] == null ? null : double.parse(json['rating'].toString()),
        stock: json['stock'],
        tags: (json['tags'] as List<dynamic>).cast<String>(),
        brand: json['brand'],
        sku: json['sku'],
        weight: json['weight'] == null ? null : double.parse(json['weight'].toString()),
        dimensions: json['dimensions'] == null ? null : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
        warrantyInformation: json['warrantyInformation'],
        shippingInformation: json['shippingInformation'],
        availabilityStatus: json['availabilityStatus'],
        reviews: json['reviews'] == null ? [] : (json['reviews'] as List<dynamic>).map((review) => Review.fromJson(review as Map<String, dynamic>)).toList(),
        returnPolicy: json['returnPolicy'],
        minimumOrderQuantity: json['minimumOrderQuantity'],
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        images: (json['images'] as List<dynamic>).cast<String>(),
        thumbnail: json['thumbnail'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'tags': tags,
        'brand': brand,
        'sku': sku,
        'weight': weight,
        'dimensions': dimensions?.toJson(),
        'warrantyInformation': warrantyInformation,
        'shippingInformation': shippingInformation,
        'availabilityStatus': availabilityStatus,
        'reviews': reviews?.map((review) => review.toJson()).toList(),
        'returnPolicy': returnPolicy,
        'minimumOrderQuantity': minimumOrderQuantity,
        'meta': meta?.toJson(),
        'images': images,
        'thumbnail': thumbnail,
      };
}

class Dimensions {
  final double? width;
  final double? height;
  final double? depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: double.parse(json['width']?.toString() ?? "0"),
        height: double.parse(json['height']?.toString() ?? "0"),
        depth: double.parse(json['depth']?.toString() ?? '0'),
      );

  Map<String, dynamic> toJson() => {
        'width': width,
        'height': height,
        'depth': depth,
      };
}

class Review {
  final num rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json['rating'] as num,
        comment: json['comment'],
        date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
        reviewerName: json['reviewerName'],
        reviewerEmail: json['reviewerEmail'],
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'comment': comment,
        'date': date?.toIso8601String(),
        'reviewerName': reviewerName,
        'reviewerEmail': reviewerEmail,
      };
}

class Meta {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        barcode: json['barcode'] as String,
        qrCode: json['qrCode'] as String,
      );

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'barcode': barcode,
        'qrCode': qrCode,
      };
}
