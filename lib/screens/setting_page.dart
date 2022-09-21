import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/color_theme_data.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema Seçimi'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const SwitchCard(),
    );
  }
}

class SwitchCard extends StatefulWidget {
  const SwitchCard({Key? key}) : super(key: key);

  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    String greenText = 'Green';
    String redText = 'Red';
    return Card(
      child: SwitchListTile(value: _value, onChanged: (bool value) { setState(() {
        _value = value;
        Provider.of<ColorThemeData>(context, listen: false).switchTheme(value);
      });  } ,
        subtitle: Text(_value?redText:greenText, style: TextStyle(color: Theme.of(context).primaryColor),),
        title:  const Text('Change Theme Color', style: TextStyle(color: Colors.black26),),
      ),
    );
  }
}
