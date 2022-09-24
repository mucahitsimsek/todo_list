import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Item> _items = [
    //   Item(title: 'peynir al'),
    //   Item(title: 'Çöpü at'),
    //   Item(title: 'faturayı kes'),
  ];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(title: title));
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // ignore: unused_field
  static late SharedPreferences _sharedPreferences;

  //SHARED PREFERENCES METOTLARI
  Future<void> createPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  List<String> _itemsAsString = [];

  void saveItemsToSharedPref(List<Item> items) {
    //List<Item> =>>> List<String>
    _itemsAsString.clear();
    for (var item in items) {
      _itemsAsString.add(json.encode(item.toMap()));
    }
    //shared preferences kaydet
    _sharedPreferences.setStringList('toDoData', _itemsAsString);
  }

  void loadItemsFromSharedPref() {
    List<String> tempList = _sharedPreferences.getStringList('toDoData') ?? [];

    _items.clear();
    for (var item in tempList) {
      _items.add(Item.fromMap(jsonDecode(item)));
    }
  }

  void loadThemeFromSharedPref() {}
}
