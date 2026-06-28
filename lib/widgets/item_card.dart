import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/bloc/item_bloc.dart';
import 'package:task2/bloc/item_event.dart';
import 'package:task2/models/item_model.dart';

class ItemCard extends StatelessWidget {
  ItemCard({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white, size: 35),
      ),
      onDismissed: (direction) {
        context.read<ItemBloc>().add(DeleteItemEvent(ItemId: item.id));
      },
      key: ValueKey(item.id),
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Checkbox(
                value: item.isBought,
                onChanged: (_) => context.read<ItemBloc>().add(
                  ChangetemEvent(ItemId: item.id),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: item.isBought
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: item.isBought ? Colors.grey : Colors.black,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "${item.quantity}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Icon(
                item.isBought
                    ? Icons.check_circle
                    : Icons.shopping_cart_outlined,
                color: item.isBought ? Colors.green : Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
