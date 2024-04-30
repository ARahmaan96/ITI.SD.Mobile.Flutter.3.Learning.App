import 'package:flutter/material.dart';
import 'package:learning_app/components/list_detailed_item.dart';
import 'package:learning_app/models/List_Item_model.dart';

class DetailedPage extends StatelessWidget {
  final List<ListItemModel> items;
  final String title;
  final Color? color;
  const DetailedPage(
      {super.key, required this.items, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Color.fromARGB(255, 238, 238, 238)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 173, 181),
      ),
      backgroundColor: const Color.fromARGB(255, 57, 62, 70),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListDetailedItem(item: items[index], color: color!);
          },
        ),
      ),
    );
  }
}
