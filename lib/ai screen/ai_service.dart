import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';
import 'user_behavior.dart'; 

class AIService {
  static const apiKey = "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"; // استبدلي مفتاحك هنا

  static Stream<String> streamResponse(String message, List<Product> products) async* {
    final history = await UserBehavior.getHistory();
    final topInterest = await UserBehavior.getMostViewedQuery();
    final productsJson = products.take(20).map((e) => {
      "id": e.id, 
      "title": e.title, 
      "price": e.price,
      "category": e.description.split(' ').first, 
    }).toList();

    final url = Uri.parse("https://openrouter.ai/api/v1/chat/completions");

    final body = jsonEncode({
      "model": "openai/gpt-4o-mini",
      "stream": true,
      "messages": [
        {
          "role": "system", 
          "content": """You are a professional Cyberpunk-themed Shopping Assistant.
          - Languages: Respond in the language used by the user (Arabic/English).
          - Context: The user is interested in '$topInterest' based on their history: $history.
          - Strategy: If the user asks for something not in the list, look for the closest match or suggest a 'Trending' product from the list.
          - Output: You MUST strictly return JSON for the final complete thought.
          
          Format:
          {
            "type": "recommendation",
            "text": "Your stylish response here",
            "products": [ids]
          }
          
          Available Products: $productsJson"""
        },
        {"role": "user", "content": message}
      ],
    });

    try {
      final request = http.Request("POST", url);
      request.headers.addAll({
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      });
      request.body = body;

      final response = await request.send();
      
      await for (var chunk in response.stream.transform(utf8.decoder)) {
        final lines = chunk.split('\n');
        for (var line in lines) {
          final trimmed = line.trim();
          if (trimmed.isEmpty || trimmed == 'data: [DONE]') continue;
          if (trimmed.startsWith('data: ')) {
            try {
              final jsonString = trimmed.substring(6);
              final decoded = jsonDecode(jsonString);
              final content = decoded['choices'][0]['delta']['content'];
              if (content != null) yield content as String;
            } catch (e) { continue; }
          }
        }
      }
    } catch (e) {
      yield "Connection error. Please try again later.";
    }
  }
}