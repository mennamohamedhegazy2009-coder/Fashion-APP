import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {"name": "Black Winter...", "price": "499", "rating": 4, "img": 'assets/unsplash_NoVnXXmDNi0.png'},
    {"name": "Mens Starry", "price": "399", "rating": 5, "img": 'assets/unsplash_0vsk2_9dkqo.png'},
    {"name": "Black Dress", "price": "2,000", "rating": 4, "img": 'assets/unsplash_yTBMYCcZQRs.png'},
    {"name": "Pink Embroide...", "price": "1,500", "rating": 5, "img": 'assets/unsplash_Pdds9XsWyoM.png'},
    {"name": "Flare Dress", "price": "1,990", "rating": 4, "img": 'assets/unsplash_9U18fiowwbw.png'},
    {"name": "denim dress", "price": "999", "rating": 3, "img": 'assets/unsplash_0vsk2_9dkqo (1).png'},
    {"name": "Jordan Stay", "price": "800", "rating": 5, "img": 'assets/unsplash_yTBMYCcZQRs (1).png'},
    {"name": "Realme 7 ", "price": "1,500", "rating": 5, "img": 'assets/unsplash_Pdds9XsWyoM (1).png'},
    {"name": "Sony PS4", "price": "1,990", "rating": 4, "img": 'assets/unsplash_9U18fiowwbw (1).png'},
    {"name": "Black Jacket 12...", "price": "999", "rating": 3, "img": 'assets/unsplash_0vsk2_9dkqo (2).png'},
    {"name": "D7200 Digital C...", "price": "15,000", "rating": 5, "img": 'assets/unsplash_yTBMYCcZQRs (2).png'},
    {"name": "men’s & boys s...", "price": "1,990", "rating": 4, "img": 'assets/unsplash_Pdds9XsWyoM (2).png'},
    {"name": "Muscle Blaze...", "price": "999", "rating": 3, "img": 'assets/unsplash_9U18fiowwbw (2).png'},
    {"name": "Hot chocolate", "price": "1,500", "rating": 5, "img": 'assets/unsplash_0vsk2_9dkqo (3).png'},
  ];

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF202020)),
          onPressed: () {},
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/LOGO.png', width: 30, errorBuilder: (c, e, s) => const Icon(Icons.shopping_bag, color: Color(0xFFFD6E87))),
            const SizedBox(width: 5),
            const Text("Stylish",
                style: TextStyle(color: Color(0xFFFD6E87), fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/Avatar.png'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildSubHeader(),
          Expanded(
            child: _buildProductGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: FadeInDown(
        duration: const Duration(milliseconds: 500),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)],
          ),
          child: const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: Colors.grey),
              hintText: "Search any Product...",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              border: InputBorder.none,
              suffixIcon: Icon(Icons.mic_none, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("52,082+ Items", 
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
          Row(
            children: [
              _buildActionButton("Sort", Icons.swap_vert),
              const SizedBox(width: 8),
              _buildActionButton("Filter", Icons.filter_alt_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FadeInUp(
          delay: Duration(milliseconds: index * 50),
          child: ProductCard(product: products[index]),
        );
      },
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.black, fontSize: 12)),
          const SizedBox(width: 4),
          Icon(icon, color: Colors.black, size: 16),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product['img'], 
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (c, e, s) => Container(
                color: Colors.grey[200],
                child: const Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product['name'], 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              const Text("Autumn And Winter Casual...",
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 11)),
              const SizedBox(height: 4),
              Text("₹${product['price']}", 
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (i) => Icon(
                      Icons.star,
                      size: 12,
                      color: i < product['rating'] ? Colors.orange : Colors.grey.shade300,
                    )),
                  ),
                  const SizedBox(width: 4),
                  const Text("56,890", style: TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}