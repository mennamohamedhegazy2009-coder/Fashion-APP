import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'ai_service.dart';
import 'product_details.dart';
import 'cart_provider.dart';
import 'package:http/http.dart' as http;

class AIShopChat extends StatefulWidget {
  const AIShopChat({super.key});

  @override
  State<AIShopChat> createState() => _AIShopChatState();
}

class _AIShopChatState extends State<AIShopChat> {
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Product> products = [];
  List<Widget> chatWidgets = [];
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }
  Future<void> loadProducts() async {
    try {
      final res = await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
      final List data = jsonDecode(utf8.decode(res.bodyBytes));
      setState(() {
        products = data.map((e) => Product.fromJson(e)).toList();
      });
    } catch (e) {
      debugPrint("Error loading products: $e");
    }
  }

 void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void send() async {
    final text = controller.text.trim();
    if (text.isEmpty) return;
    controller.clear();

    setState(() {
      chatWidgets.add(chatBubble(text, isUser: true));
      isTyping = true;
    });
    scrollToBottom();

    String fullAIResponse = "";
    final stream = AIService.streamResponse(text, products);

    stream.listen((chunk) {
      fullAIResponse += chunk;
    }, onDone: () {
      if (!mounted) return;
      setState(() {
        isTyping = false;
        try {
          String cleanedResponse = fullAIResponse
              .replaceAll('```json', '')
              .replaceAll('```', '')
              .trim();

          final jsonData = jsonDecode(cleanedResponse);
          
         String aiText = jsonData["text"] ?? "إليك ما وجدته:";
          chatWidgets.add(chatBubble(aiText, isUser: false));
          if (jsonData["products"] != null && jsonData["products"] is List) {
            chatWidgets.add(buildProductList(List<int>.from(jsonData["products"])));
          }
        } catch (e) {
          chatWidgets.add(chatBubble(fullAIResponse, isUser: false));
        }
      });
      scrollToBottom();
    });
  }

  Widget chatBubble(String text, {required bool isUser}) {
    bool isArabic = text.contains(RegExp(r'[ب-ي]'));
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          gradient: isUser 
            ? const LinearGradient(colors: [Colors.blueAccent, Colors.blue])
            : LinearGradient(colors: [Colors.grey[850]!, Colors.grey[900]!]),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isUser ? 20 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 20),
          ),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))],
        ),
        child: Text(
          text,
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 15,
            height: 1.4,
          ),
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        ),
      ),
    );
  }

  Widget buildProductList(List<int> ids) {
    final filtered = products.where((p) => ids.contains(p.id)).toList();
    if (filtered.isEmpty) return const SizedBox();

    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final p = filtered[index];
          return Container(
            width: 170,
            margin: const EdgeInsets.only(right: 12),
            child: Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        p.images.first.replaceAll('[', '').replaceAll(']', '').replaceAll('"', ''),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        Text("\$${p.price}", style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(p))),
                            child: const Text("View Details", style: TextStyle(fontSize: 11)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("AI SHOP ASSISTANT", style: GoogleFonts.orbitron(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.shopping_cart, color: Colors.white),
                Positioned(
                  right: 0,
                  top: 10,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      context.watch<CartProvider>().items.length.toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: chatWidgets.length,
              itemBuilder: (context, index) => chatWidgets[index],
            ),
          ),
          if (isTyping)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Typing ...", style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic)),
              ),
            ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: " Ask for fashion recommendations...",
                      hintStyle: const TextStyle(color: Colors.white38),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.black45,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onSubmitted: (_) => send(),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: IconButton(icon: const Icon(Icons.send, color: Colors.white), onPressed: send),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
