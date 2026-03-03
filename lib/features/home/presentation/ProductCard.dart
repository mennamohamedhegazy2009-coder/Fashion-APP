import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/features/search/data/prodact%20model.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      margin: const EdgeInsets.only(right: 16, bottom: 10, top: 5),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(product.image, height: 130, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColor.textPrimary),
                  maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(product.description, 
                  style: const TextStyle(fontSize: 10, color: AppColor.textSecondary), 
                  maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Text(product.price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColor.textPrimary)),
                Row(
                  children: [
                    Text(product.oldPrice, 
                      style: const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 11, color: AppColor.textHint)),
                    const SizedBox(width: 6),
                    Text(product.discount, style: const TextStyle(color: AppColor.primary, fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}