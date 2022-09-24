import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/color_theme_data.dart';
import 'package:todo_list/screens/home_page.dart';

import 'models/items_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(
      create: (BuildContext context) => ItemData(),
    ),
    ChangeNotifierProvider<ColorThemeData>(
        create: (context) => ColorThemeData()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer2<ItemData, ColorThemeData>(
      builder: (context, itemData, colorThemeData, child) {
        colorThemeData.loadThemeFromSharedPref();
        itemData.loadItemsFromSharedPref();
        return MaterialApp(
          title: 'Flutter Demo',
          theme: Provider.of<ColorThemeData>(context).selectedThemeData,
          home: const HomePage(),
        );
      },
    );
  }
}
