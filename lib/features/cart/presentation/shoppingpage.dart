import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/presentation/checkout.dart';
import 'package:flutter_application_1/features/cart/presentation/detailsof%20payment.dart'; 

class ShoppingBagScreen extends StatelessWidget {
  const ShoppingBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Shopping Bag",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCartItem(),
            const SizedBox(height: 30),
            _buildApplyCoupons(),
            const Divider(height: 40, thickness: 1),
            const Text(
              "Order Payment Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildPaymentRow("Order Amounts", "₹ 7,000.00"),
            _buildPaymentRow("Convenience", "Apply Coupon", isLink: true, linkLabel: "Know More"),
            _buildPaymentRow("Delivery Fee", "Free", isFree: true),
            const Divider(height: 40, thickness: 1),
            _buildPaymentRow("Order Total", "₹ 7,000.00", isTotal: true),
            Row(
              children: [
                const Text("EMI Available", style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text("Details", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            const SizedBox(height: 100), 
          ],
        ),
      ),
      bottomSheet: _buildBottomCheckoutBar(context), 
    );
  }
  Widget _buildCartItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/image 15.png', 
            width: 100,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Women's Casual Wear", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Text("Checked Single-Breasted Blazer", style: TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildDropdown("Size", "42"),
                  const SizedBox(width: 15),
                  _buildDropdown("Qty", "1"),
                ],
              ),
              const SizedBox(height: 10),
              const Text.rich(
                TextSpan(
                  text: "Delivery by ",
                  children: [
                    TextSpan(text: "10 May 2XXX", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDropdown(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Text("$label  $value", style: const TextStyle(fontSize: 12)),
          const Icon(Icons.keyboard_arrow_down, size: 16),
        ],
      ),
    );
  }

  Widget _buildApplyCoupons() {
    return Row(
      children: [
        const Icon(Icons.confirmation_number_outlined, color: Colors.black),
        const SizedBox(width: 10),
        const Text("Apply Coupons", style: TextStyle(fontWeight: FontWeight.bold)),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text("Select", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget _buildPaymentRow(String label, String value, {bool isLink = false, String? linkLabel, bool isFree = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
              if (isLink) Text(linkLabel!, style: const TextStyle(color: Colors.red, fontSize: 12)),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: isLink ? Colors.red : (isFree ? Colors.green : Colors.black),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildBottomCheckoutBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("₹ 7,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                  );
                },
                child: const Text(
                  "View Details",
                  style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentCheckoutScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFA4248),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("Proceed to Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}