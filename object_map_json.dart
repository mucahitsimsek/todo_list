// import 'dart:convert';

// main() {
//   // ignore: unused_local_variable
//   Item itemObject = Item(title: 'uyu', isDone: true);
//   print('itemObject: $itemObject');
//   print('itemObject type: ${itemObject.runtimeType}');

//   Map itemAsMap = itemObject.toMap();
//   print('itemAsMap: $itemAsMap');
//   print('itemAsMap type: ${itemAsMap.runtimeType}');

//   String itemAsJson = json.encode(itemAsMap);
//   print('itemAsJson: $itemAsJson');
//   print('itemAsJson type: ${itemAsJson.runtimeType}');

//   itemAsMap = json.decode(itemAsJson);
//   itemObject = Item(title: itemAsMap['title'], isDone: itemAsMap['isDone']);
//   print(itemObject);
// }

// class Item {
//   late String? title;
//   late bool isDone;
//   Item({required this.isDone, this.title});

//   Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
// }
