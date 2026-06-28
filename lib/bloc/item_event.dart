class ItemEvent {}

class GetItemEvent extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  final String name;
  final String quantity;

  AddItemEvent({required this.name, required this.quantity});
}

class DeleteItemEvent extends ItemEvent {
  final String ItemId;

  DeleteItemEvent({required this.ItemId});
}

class ChangetemEvent extends ItemEvent {
  final String ItemId;

  ChangetemEvent({required this.ItemId});
}
