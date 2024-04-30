import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:learning_app/models/List_Item_model.dart';

class ListDetailedItem extends StatelessWidget {
  final Color? color;
  final ListItemModel item;

  const ListDetailedItem({
    super.key,
    this.color,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          item.imagePath != null
              ? Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(80, 100, 100, 100),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  width: 50,
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.asset(item.imagePath!),
                )
              : const SizedBox(),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 173, 181),
                    ),
                    item.originalText ?? "",
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    item.translatedText ?? "",
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              try {
                final player = AudioPlayer();
                await player.play(AssetSource(item.audioPath!));
              } catch (e) {
                print('Error playing audio: $e');
              }
            },
            icon: const Icon(Icons.play_arrow_outlined),
          ),
        ],
      ),
    );
  }
}
