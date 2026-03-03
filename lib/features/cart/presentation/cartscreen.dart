import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/presentation/shoppingpage.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedSize = "7 UK";
  int activeImageIndex = 0;
  final PageController _pageController = PageController();
  final List<String> productImages = [
    "assets/unsplash_NoVnXXmDNi0 (1).png",
    "assets/unsplash_76w_eDO1u1E.png",
    "assets/unsplash_mHUk4Se7peY.png",
    "assets/unsplash_FUR3LNiI2jc.png",
    "assets/unsplash_EJTjetc8tPs.png",
  ];
  final List<String> similarProductsImages = [
    "assets/unsplash_ZBuWS1el_50.png",  
    "assets/unsplash_FUR3LNiI2jc (1).png", 
    "assets/unsplash_mHUk4Se7peY.png",
    "assets/unsplash_76w_eDO1u1E.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainImageSlider(),
            _buildPageIndicator(),
            _buildThumbnailRow(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Size: $selectedSize", 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  _buildSizeSelector(),
                  
                  const SizedBox(height: 20),
                  const Text("Nike Sneakers", 
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Text("Vision Alta Men's Shoes Size (All Colours)", 
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 10),
                  _buildRatingRow(),
                  const SizedBox(height: 10),
                  _buildPriceSection(),
                  const SizedBox(height: 20),
                  const Text("Product Details", 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text(
                    "Perhaps the most iconic sneaker of all-time, this original 'Chicago' colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan...",
                    style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  _buildMainButtons(),
                  const SizedBox(height: 15),
                  _buildDeliveryBanner(),
                  const SizedBox(height: 15),
                  _buildActionButtons(),
                  const SizedBox(height: 30),
                  const Text("Similar To", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  _buildSimilarHeader(),
                  _buildSimilarGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMainImageSlider() {
    return SizedBox(
      height: 280,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) => setState(() => activeImageIndex = index),
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(productImages[index]), 
                fit: BoxFit.cover
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(productImages.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8, 
          width: activeImageIndex == index ? 24 : 8,
          decoration: BoxDecoration(
            color: activeImageIndex == index ? Colors.pink : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
  Widget _buildThumbnailRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(productImages.length, (index) {
            return GestureDetector(
              onTap: () => _pageController.animateToPage(index, 
                duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
              child: Container(
                width: 60, height: 60, margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: activeImageIndex == index ? Colors.pink : Colors.transparent, 
                    width: 2
                  ),
                  image: DecorationImage(
                    image: AssetImage(productImages[index]), 
                    fit: BoxFit.cover
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
  Widget _buildSizeSelector() {
    List<String> sizes = ["6 UK", "7 UK", "8 UK", "9 UK", "10 UK"];
    return Wrap(
      spacing: 8,
      children: sizes.map((size) {
        bool isSelected = selectedSize == size;
        return GestureDetector(
          onTap: () => setState(() => selectedSize = size),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.pink : Colors.white,
              border: Border.all(color: Colors.pink),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(size, style: TextStyle(color: isSelected ? Colors.white : Colors.pink)),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        ...List.generate(4, (i) => const Icon(Icons.star, color: Colors.orange, size: 18)),
        const Icon(Icons.star_border, color: Colors.orange, size: 18),
        const SizedBox(width: 8),
        const Text("56,890", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Row(
      children: const [
        Text("₹2,999", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 16)),
        SizedBox(width: 10),
        Text("₹1,500", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        SizedBox(width: 10),
        Text("50% Off", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildMainButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingBagScreen ()));
            },
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 18),
            label: const Text("Go to cart", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3366CC),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.touch_app_outlined, color: Colors.white, size: 18),
            label: const Text("Buy Now", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE4E9), 
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Delivery in", style: TextStyle(color: Colors.black54, fontSize: 12)),
          Text("1 within Hour", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.visibility_outlined, color: Colors.black, size: 18),
            label: const Text("View Similar", style: TextStyle(color: Colors.black, fontSize: 13)),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.compare_arrows, color: Colors.black, size: 18),
            label: const Text("Add to Compare", style: TextStyle(color: Colors.black, fontSize: 13)),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSimilarHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("282+ Items", style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              _filterBtn("Sort", Icons.swap_vert),
              const SizedBox(width: 8),
              _filterBtn("Filter", Icons.filter_list),
            ],
          )
        ],
      ),
    );
  }
  Widget _filterBtn(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(children: [
        Text(label, style: const TextStyle(fontSize: 12)),
        const SizedBox(width: 4),
        Icon(icon, size: 14),
      ]),
    );
  }
  Widget _buildSimilarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 0.65, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        String currentImage = (index < similarProductsImages.length) 
            ? similarProductsImages[index] 
            : similarProductsImages[0];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(currentImage, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Nike Sneakers", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const Text(
              "Nike Air Jordan Retro 1 Low Mystic Black",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            const Text("₹1,900", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            _buildSmallRating(),
          ],
        );
      },
    );
  }

  Widget _buildSmallRating() {
    return Row(
      children: [
        ...List.generate(4, (i) => const Icon(Icons.star, color: Colors.orange, size: 12)),
        const Icon(Icons.star_half, color: Colors.orange, size: 12),
        const SizedBox(width: 4),
        const Text("46,890", style: TextStyle(color: Colors.grey, fontSize: 10)),
      ],
    );
  }
}