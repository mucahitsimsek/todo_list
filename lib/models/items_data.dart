import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    Item(title: 'peynir al'),
    Item(title: 'Çöpü at'),
    Item(title: 'faturayı kes'),
  ];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(title: title));
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
