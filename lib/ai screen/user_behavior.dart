import 'package:shared_preferences/shared_preferences.dart';

class UserBehavior {
  static const String _key = "user_behavior_history";
  static const int _maxHistoryLength = 20; // تحديد حد أقصى للحفاظ على الأداء

  // تتبع المشاهدة مع منع التكرار المتتالي وتحسين التخزين
  static Future<void> trackView(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList(_key) ?? [];
    
    final formattedTitle = title.trim().toLowerCase();

    // منع إضافة نفس المنتج إذا كان هو آخر منتج تم مشاهدته
    if (history.isNotEmpty && history.last == formattedTitle) return;

    // إضافة المنتج الجديد
    history.add(formattedTitle);

    // الحفاظ على آخر 20 عنصر فقط (FIFO)
    if (history.length > _maxHistoryLength) {
      history.removeAt(0);
    }

    await prefs.setStringList(_key, history);
  }

  // الحصول على التاريخ (مرتب من الأحدث إلى الأقدم)
  static Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_key) ?? [];
    return history.reversed.toList(); 
  }

  // دالة مفيدة للذكاء الاصطناعي لمعرفة أكثر التصنيفات التي يفضلها المستخدم
  static Future<String> getMostViewedQuery() async {
    final history = await getHistory();
    if (history.isEmpty) return "";
    
    // حساب الأكثر تكراراً (بسيط) لإرساله للـ AI كـ Context
    final Map<String, int> counts = {};
    for (var item in history) {
      counts[item] = (counts[item] ?? 0) + 1;
    }
    
    var sortedKeys = counts.keys.toList()
      ..sort((a, b) => counts[b]!.compareTo(counts[a]!));
      
    return sortedKeys.first;
  }

  // مسح السجل تماماً
  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}