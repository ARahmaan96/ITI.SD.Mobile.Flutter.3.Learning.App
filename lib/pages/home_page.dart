import 'package:flutter/material.dart';
import 'package:learning_app/components/list_text_item_component.dart';
import 'package:learning_app/helpers/load_data.dart';
import 'package:learning_app/pages/detailed_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Map<String, String>> items = [
    {
      "name": "Numbers",
      "id": "numbers",
    },
    {
      "name": "Family Member",
      "id": "family_member",
    },
    {
      "name": "Colors",
      "id": "colors",
    },
    {
      "name": "Pharses",
      "id": "pharses",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Learing App",
          style: TextStyle(
            color: Color.fromARGB(255, 238, 238, 238),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 34, 40, 49),
      ),
      backgroundColor: const Color.fromARGB(255, 57, 62, 70),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTextItem(
              text: items[index]["name"]!,
              color: const Color.fromARGB(255, 0, 173, 181),
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedPage(
                      color: const Color.fromARGB(255, 34, 40, 49),
                      items: DataLoader().load(items[index]["id"]!),
                      title: items[index]["name"]!,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
