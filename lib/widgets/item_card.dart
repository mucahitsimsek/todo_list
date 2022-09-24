import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key, this.title, this.isDone, this.toggleStatus, this.deleteItem})
      : super(key: key);

  final String? title;
  final bool? isDone;
  final Function(bool?)? toggleStatus;
  final void Function()? deleteItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: UniqueKey(),
      onLongPress: deleteItem,
      child: Card(
        color: isDone! ? Colors.green.shade50 : Colors.white,
        elevation: isDone! ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title!,
            style: TextStyle(
                color: Colors.black,
                decoration: isDone! ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            value: isDone,
            onChanged: toggleStatus,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
