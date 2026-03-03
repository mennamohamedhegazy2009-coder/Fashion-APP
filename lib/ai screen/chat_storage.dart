import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChatStorage {
  static const String _key = "ai_chat_history_v2"; // تغيير المفتاح عند تحديث الهيكل

  // حفظ الرسائل مع معالجة الأخطاء
  static Future<void> save(List<Map<String, dynamic>> messages) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encodedData = jsonEncode(messages);
      await prefs.setString(_key, encodedData);
    } catch (e) {
      print("Error saving chat storage: $e");
    }
  }

  // تحميل الرسائل وإرجاع قائمة فارغة في حالة الخطأ أو عدم وجود بيانات
  static Future<List<Map<String, dynamic>>> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? data = prefs.getString(_key);
      
      if (data == null || data.isEmpty) return [];

      final List<dynamic> decodedData = jsonDecode(data);
      return decodedData.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      print("Error loading chat storage: $e");
      return [];
    }
  }

  // مسح السجل تماماً (عندما يريد المستخدم بدء محادثة جديدة)
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
  
  // دالة إضافية للتحقق من وجود سجل سابق (مفيدة لإظهار زر "استكمال المحادثة")
  static Future<bool> hasHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_key);
  }
}