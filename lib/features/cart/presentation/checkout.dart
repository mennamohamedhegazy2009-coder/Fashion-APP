import 'package:flutter/material.dart';

class PaymentCheckoutScreen extends StatefulWidget {
  const PaymentCheckoutScreen({super.key});

  @override
  State<PaymentCheckoutScreen> createState() => _PaymentCheckoutScreenState();
}

class _PaymentCheckoutScreenState extends State<PaymentCheckoutScreen> {
  String selectedPayment = 'Visa';
  final TextEditingController _cardNumberController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    super.dispose();
  }

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
          "Checkout",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildPriceRow("Order", "₹ 7,000"),
              _buildPriceRow("Shipping", "₹ 30"),
              const SizedBox(height: 10),
              _buildPriceRow("Total", "₹ 7,030", isTotal: true),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 25),
              const Text(
                "Enter Card Number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number, 
                decoration: InputDecoration(
                  hintText: "1234 5678 9012 3456",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: const Icon(Icons.credit_card, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildPaymentOption(
                label: "Visa",
                cardNumber: "*********2109",
                iconAsset: 'assets/visa 1.png',
                isSelected: selectedPayment == 'Visa',
                onTap: () => setState(() => selectedPayment = 'Visa'),
              ),
              _buildPaymentOption(
                label: "PayPal",
                cardNumber: "*********2109",
                iconAsset: 'assets/paypal 1.png',
                isSelected: selectedPayment == 'PayPal',
                onTap: () => setState(() => selectedPayment = 'PayPal'),
              ),
              _buildPaymentOption(
                label: "Maestro",
                cardNumber: "*********2109",
                iconAsset: 'assets/maestro 1.png',
                isSelected: selectedPayment == 'Maestro',
                onTap: () => setState(() => selectedPayment = 'Maestro'),
              ),
              _buildPaymentOption(
                label: "Apple Pay",
                cardNumber: "*********2109",
                iconAsset: 'assets/apple_logo.png',
                isSelected: selectedPayment == 'Apple',
                onTap: () => setState(() => selectedPayment = 'Apple'),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                 onPressed: () {
      _showSuccessDialog(context);
    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF83758),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildPriceRow(String label, String price, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: isTotal ? Colors.black : Colors.grey.shade600)),
          Text(price, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
  Widget _buildPaymentOption({
    required String label,
    required String cardNumber,
    required String iconAsset,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFF83758) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              iconAsset, 
              width: 35, 
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.payment, color: Colors.grey),
            ),
            const SizedBox(width: 15),
            Text(cardNumber, style: TextStyle(color: Colors.grey.shade600)),
            const Spacer(),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (isSelected) ...[
              const SizedBox(width: 10),
              const Icon(Icons.check_circle, color: Color(0xFFF83758), size: 20),
            ]
          ],
        ),
      ),
    );
  }
  void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/Group 34011.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  ...List.generate(20, (index) => Positioned(
                    top: index % 2 == 0 ? 10 : 70,
                    left: index * 15.0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF83758).withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                "Payment done successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
}