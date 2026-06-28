import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/bloc/item_bloc.dart';
import 'package:task2/bloc/item_event.dart';
import 'package:task2/bloc/item_state.dart';
import 'package:task2/widgets/items_builder.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    context.read<ItemBloc>().add(GetItemEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHopping Item"),
        backgroundColor: Colors.amber,
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is InitalState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemLoadedState) {
            return ItemsBuilder(items: state.itemList);
          } else if (state is EmptyItemState) {
            return Center(child: Text("No item >>> plz Add an item"));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottom(context);
        },
      ),
    );
  }

  void showBottom(BuildContext context) {
    final nameController = TextEditingController();
    final quantityController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Item Name"),
              ),

              SizedBox(height: 15),

              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Quantity"),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  context.read<ItemBloc>().add(
                    AddItemEvent(
                      name: nameController.text,
                      quantity: quantityController.text,
                    ),
                  );

                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
        );
      },
    );
  }
}
