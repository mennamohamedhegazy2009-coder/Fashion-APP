class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      title: json["title"] ?? "No Title",
      price: (json["price"] as num?)?.toDouble() ?? 0.0,
      description: json["description"] ?? "",
      images: (json["images"] as List<dynamic>?)
              ?.map((e) => e.toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .replaceAll('"', ''))
              .toList() ?? [],
    );
  }

  String get firstImage {
    if (images.isNotEmpty && images.first.startsWith('http')) {
      return images.first;
    }
    return "https://via.placeholder.com/300?text=No+Image";
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "images": images,
    };
  }
}
