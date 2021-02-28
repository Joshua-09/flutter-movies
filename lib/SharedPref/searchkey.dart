import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  List<String> searchKey = [];

  readSearchKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  saveSearchKey(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    searchKey = value;
    prefs.setStringList(key, searchKey);
  }

  removeSearchKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
