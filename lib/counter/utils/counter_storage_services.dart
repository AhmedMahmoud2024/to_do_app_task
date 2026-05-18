import 'package:shared_preferences/shared_preferences.dart';

class CounterStorageServices{
static const String _counterKey= 'counter_value';

static Future<int> loadCounter()async{
final prefs = await SharedPreferences.getInstance();
return prefs.getInt(_counterKey) ?? 0;
}

static Future<void> saveCounter(int value)async{
final prefs = await SharedPreferences.getInstance();
await prefs.setInt(_counterKey, value);
}
}