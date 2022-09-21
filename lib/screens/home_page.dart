import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/items_data.dart';
import 'package:todo_list/screens/setting_page.dart';
import 'package:todo_list/widgets/item_card.dart';

import 'item_adder_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          )
        ],
        title: const Text('To Do List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${Provider.of<ItemData>(context).items.length} Items',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Consumer<ItemData>(
                    builder: (context, itemData, child) => Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: itemData.items.length,
                          itemBuilder: (context, index) {
                            return ItemCard(
                              title: itemData.items[index].title,
                              isDone: itemData.items[index].isDone,
                              toggleStatus: (_) => itemData.toggleStatus(index),
                              deleteItem: () => itemData.deleteItem(index),
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              context: context,
              builder: (context) =>
                  const SingleChildScrollView(child: ItemaAdderContainer()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
