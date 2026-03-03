import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/favourite/presentation/Favoritescreen.dart';
import 'package:flutter_application_1/features/search/data/prodact%20model.dart';
class ProductHorizontalList extends StatelessWidget {
   ProductHorizontalList({super.key});
    final List<Product> myProducts = [
    Product(
      title: "Women Printed Kurta",
      description: "Neque porro quisquam est qui dolorem ipsum quia",
      price: "₹1500",
      oldPrice: "₹2499",
      discount: "40%Off",
      image: "assets/Mask Group (1).png",
    ),
    Product(
      title: "HRX by Hrithik Roshan",
      description: "Neque porro quisquam est qui dolorem ipsum quia",
      price: "₹2499",
      oldPrice: "₹4999",
      discount: "50%Off",
      image: "assets/Mask Group (2).png",
    ),
    Product(
      title: "Women Printed Kurta",
      description: "Neque porro quisquam est qui dolorem ipsum quia",
      price: "₹1500",
      oldPrice: "₹2499",
      discount: "40%Off",
      image: "assets/Mask Group (3).png",
    ),
    Product(
      title: "HRX by Hrithik Roshan",
      description: "Neque porro quisquam est qui dolorem ipsum quia",
      price: "₹2499",
      oldPrice: "₹4999",
      discount: "50%Off",
      image: "assets/Mask Group (4).png",
    ),
  ];

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: myProducts.length,
        itemBuilder: (context, index) => ProductCard(product: myProducts[index]),
      ),
    );
  }
}