import 'package:shared_preferences/shared_preferences.dart';

class UserBehavior {
  static const String _key = "user_behavior_history";
  static const int _maxHistoryLength = 20;

  static Future<void> trackView(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList(_key) ?? [];
    
    final formattedTitle = title.trim().toLowerCase();

    if (history.isNotEmpty && history.last == formattedTitle) return;

    history.add(formattedTitle);

    if (history.length > _maxHistoryLength) {
      history.removeAt(0);
    }

    await prefs.setStringList(_key, history);
  }

  static Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_key) ?? [];
    return history.reversed.toList(); 
  }

  static Future<String> getMostViewedQuery() async {
    final history = await getHistory();
    if (history.isEmpty) return "";
    
    final Map<String, int> counts = {};
    for (var item in history) {
      counts[item] = (counts[item] ?? 0) + 1;
    }
    
    var sortedKeys = counts.keys.toList()
      ..sort((a, b) => counts[b]!.compareTo(counts[a]!));
      
    return sortedKeys.first;
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
