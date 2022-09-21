import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/items_data.dart';

class ItemaAdderContainer extends StatelessWidget {
  const ItemaAdderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textCotroller = TextEditingController();
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Colors.yellow.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textCotroller,
              style: TextStyle(color: Colors.green.shade700),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Item',
                hintText: '...',
              ),
              autofocus: true,
              onChanged: (e) {
                if (kDebugMode) {
                  print(textCotroller.text);
                }
              },
            ),
            ElevatedButton(
              onPressed: (){
                Provider.of<ItemData>(context, listen: false).addItem(textCotroller.text);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
