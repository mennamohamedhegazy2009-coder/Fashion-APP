import 'package:flutter/material.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.location_on_outlined, size: 20),
                SizedBox(width: 8),
                Text(
                  "Delivery Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildAddressSection(),
            const SizedBox(height: 25),
            const Text(
              "Shopping List",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildShoppingItem(
              title: "Women's Casual Wear",
              imagePath: "assets/image 15.png", 
              variations: ["Black", "Red"],
              rating: 4.8,
              price: 34.00,
              oldPrice: 64.00,
              discount: "33% off",
            ),
            const SizedBox(height: 16),
            _buildShoppingItem(
              title: "Men's Jacket",
              imagePath: "assets/Mask group (7).png", 
              variations: ["Green", "Grey"],
              rating: 4.7,
              price: 45.00,
              oldPrice: 67.00,
              discount: "28% off",
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildAddressSection() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Address :", style: TextStyle(fontSize: 13)),
                    Icon(Icons.edit_note, size: 20, color: Colors.grey.shade600),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "216 St Paul's Rd, London N1 2LL, UK\nContact :  +44-784232",
                  style: TextStyle(fontSize: 12, height: 1.5),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 60,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: const Icon(Icons.add_circle_outline, color: Colors.black, size: 30),
        ),
      ],
    );
  }
  Widget _buildShoppingItem({
    required String title,
    required String imagePath,
    required List<String> variations,
    required double rating,
    required double price,
    required double oldPrice,
    required String discount,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imagePath, width: 90, height: 90, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Text("Variations : ", style: TextStyle(fontSize: 11)),
                        ...variations.map((v) => Container(
                          margin: const EdgeInsets.only(right: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(v, style: const TextStyle(fontSize: 10)),
                        )).toList(),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text("$rating ", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        Icon(Icons.star_half, color: Colors.orange, size: 14),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("\$ $price", style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("upto $discount", style: const TextStyle(color: Colors.red, fontSize: 10)),
                            Text("\$ $oldPrice", style: const TextStyle(color: Colors.grey, fontSize: 12, decoration: TextDecoration.lineThrough)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Order (1) :", style: TextStyle(fontSize: 13)),
              Text("\$ $price", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }
}