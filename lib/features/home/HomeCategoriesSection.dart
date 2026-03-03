import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildCategories();
  }

  Widget _buildCategories() {
    final List<Map<String, String>> categories = [
      {"name": "Beauty", "img": "assets/Ellipse 1.png"},
      {"name": "Fashion", "img": "assets/unsplash__3Q3tsJ01nc 2.png"},
      {"name": "Kids", "img": "assets/unsplash_GCDjllzoKLo 3.png"},
      {"name": "Mens", "img": "assets/unsplash_xPJYL0l5Ii8 4.png"},
      {"name": "Womens", "img": "assets/unsplash_OYYE4g-I5ZQ 5.png"},
      {"name": "Gift", "img": "assets/unsplash_PxM8aeJbzvk 6.png"},
    ];

    return FadeInLeft(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategoryItem(categories[index]["name"]!, categories[index]["img"]!),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }
}