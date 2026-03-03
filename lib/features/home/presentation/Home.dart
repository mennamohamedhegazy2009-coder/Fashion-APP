import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/features/search/data/prodact%20model.dart';


class HomeScreen extends StatelessWidget {
 HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF202020)),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(child: Image.asset('assets/LOGO.png', width: 30)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildFilterRow(),
            const SizedBox(height: 15),
            _buildCategories(),            
            _buildMainBanner(),          
            _buildSectionHeader("Deal of the Day", const Color(0xFF4392F9), "22h 55m 20s remaining"),
            _buildHorizontalProductList(),
            _buildSpecialOffersCard(),
            _buildFeaturedBanner(),
            _buildSectionHeader("Trending Products", const Color(0xFFFD6E87), "Last Date 29/02/22"),
            _buildHorizontalProductList(),
            _buildNewArrivalsBanner(),
            _buildSponsoredSection(),
          ],
        ),
      ),
    );
  }
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FadeInDown(
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
              border: InputBorder.none,
              suffixIcon: Icon(Icons.mic_none, color: AppColor.textSecondary),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("All Featured", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Row(
            children: [
              _buildActionChip("Sort", Icons.swap_vert),
              const SizedBox(width: 10),
              _buildActionChip("Filter", Icons.filter_alt_outlined),
            ],
          )
        ],
      ),
    );
  }
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

  Widget _buildCategories() {
    return FadeInLeft(
      child: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            _buildCategoryItem("Beauty", "assets/Ellipse 1.png"),
            _buildCategoryItem("Fashion", "assets/unsplash__3Q3tsJ01nc 2.png"),
            _buildCategoryItem("Kids", "assets/unsplash_GCDjllzoKLo 3.png"),
            _buildCategoryItem("Mens", "assets/unsplash_xPJYL0l5Ii8 4.png"),
            _buildCategoryItem("Womens", "assets/unsplash_OYYE4g-I5ZQ 5.png"),
            _buildCategoryItem("Gift", "assets/unsplash_PxM8aeJbzvk 6.png"),
          ],
        ),
      ),
    );
  }

  Widget _buildMainBanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ZoomIn(
        child: Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/Rectangle 4.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("50-40% OFF", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const Text("Now in (product)\nAll colours", style: TextStyle(color: Colors.white, fontSize: 12)),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Shop Now →"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildProductCard(myProducts[index]);
        },
      ),
    );
  }

 Widget _buildProductCard(Product product) {
  return Container(
    width: 170,
    margin: const EdgeInsets.only(right: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Image.asset(
            product.image,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) => Container(
              height: 120,
              color: Colors.grey[200],
              child: const Icon(Icons.image),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title, 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 4),
              Text(product.description, 
                style: const TextStyle(fontSize: 10, color: Colors.grey), 
                maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 6),
              Text(product.price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Row(
                children: [
                  Text(product.oldPrice, 
                    style: const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 10, color: Colors.grey)),
                  const SizedBox(width: 5),
                  Text(product.discount, style: const TextStyle(color: Colors.red, fontSize: 10)),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
  Widget _buildSpecialOffersCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Row(
        children: [
          Image.asset('assets/Rectangle 56.png', width: 60, errorBuilder: (c,e,s) => const Icon(Icons.local_offer, size: 50, color: Colors.pink)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Special Offers 🌟", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("We make sure you get the offer you need at best prices", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFeaturedBanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ZoomIn(
        child: Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/mac.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Flat and Heels", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Text("Stand a chance to get rewarded", style: TextStyle(fontSize: 11)),
                const SizedBox(height: 10),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0XFFF83758),
                    side: const BorderSide(color: Color(0XFFF83758)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("view Now →"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildActionChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4)],
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          Icon(icon, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundColor: Colors.grey[200], backgroundImage: AssetImage(imagePath)),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
  Widget _buildSectionHeader(String title, Color color, String subTitle) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white, size: 14),
                  const SizedBox(width: 4),
                  Text(subTitle, style: const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            child: const Text("View all →", style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }
  Widget _buildNewArrivalsBanner() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/Mask Group (5).png', 
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("New Arrivals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("Summer' 25 Collections", style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFFF83758),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("View all →", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    ),
  );
}
Widget _buildSponsoredSection() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sponserd", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/Mask Group (6).png', 
                  
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text("up to 50% Off", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                 ElevatedButton(onPressed: () {  },
                 child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black)),
                ],
                
              ),
              const SizedBox(height:100),
            ],
          ),
        ),
      ],
    ),
  );
}
}