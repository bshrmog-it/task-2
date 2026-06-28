import 'package:flutter/material.dart';
import 'package:task2/models/item_model.dart';
import 'package:task2/widgets/item_card.dart';

class ItemsBuilder extends StatelessWidget {
  const ItemsBuilder({super.key, required this.items});

  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ItemCard(item: items[index]);
      },
    );
  }
}
