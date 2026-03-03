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

  // Factory constructor لتحويل الـ JSON مع معالجة الأخطاء المحتملة
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      title: json["title"] ?? "No Title",
      price: (json["price"] as num?)?.toDouble() ?? 0.0,
      description: json["description"] ?? "",
      // تنظيف الروابط فور استلامها إذا كانت تحتوي على أقواس أو علامات اقتباس زائدة
      images: (json["images"] as List<dynamic>?)
              ?.map((e) => e.toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .replaceAll('"', ''))
              .toList() ?? [],
    );
  }

  // Getter للحصول على الصورة الأولى بشكل آمن
  String get firstImage {
    if (images.isNotEmpty && images.first.startsWith('http')) {
      return images.first;
    }
    // صورة افتراضية في حال عدم وجود صور لتجنب الـ Crash
    return "https://via.placeholder.com/300?text=No+Image";
  }

  // تحويل الكائن إلى Map مرة أخرى (مفيد إذا أردتِ تخزينه محلياً)
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