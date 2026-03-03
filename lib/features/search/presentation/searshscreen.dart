import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SearchScreen extends StatefulWidget {
   SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  List allProducts = [];    
  List filteredProducts = []; 
  bool isLoading = true;    

  @override
  void initState() {
    super.initState();
    fetchProducts(); 
  }
  Future<void> fetchProducts() async {
    final url = Uri.parse('https://api.escuelajs.co/api/v1/products');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        setState(() {
          allProducts = data;
          filteredProducts = data;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts
          .where((product) =>
              product["title"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
              hintText: "Search products...",
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFFF83758)))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Results", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final item = filteredProducts[index];
                      return ListTile(
                        onTap: () {
                          _openDetails(item);
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item['images'][0],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
                          ),
                        ),
                        title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("\$${item['price']}"),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
  void _openDetails(Map product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApiProductDetailsScreen(product: product),
      ),
    );
  }
}
class ApiProductDetailsScreen extends StatelessWidget {
  final Map product;
  const ApiProductDetailsScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product['images'][0], width: double.infinity, height: 350, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['title'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("\$${product['price']}", style: const TextStyle(fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(product['description'], style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}