import 'package:task2/models/item_model.dart';

class ItemState {}

class InitalState extends ItemState {}

class ItemLoadedState extends ItemState {
  final List<ItemModel> itemList;

  ItemLoadedState({required this.itemList});
}

class EmptyItemState extends ItemState {}
