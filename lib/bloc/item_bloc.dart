import 'package:bloc/bloc.dart';
import 'package:task2/bloc/item_event.dart';
import 'package:task2/bloc/item_state.dart';
import 'package:task2/models/item_model.dart';
import 'package:uuid/uuid.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  List<ItemModel> _itemList = [];
  final _uuid = Uuid();

  ItemBloc() : super(InitalState()) {
    on<GetItemEvent>(_getItem);
    on<AddItemEvent>(_addItem);
    on<DeleteItemEvent>(_deleteItem);
    on<ChangetemEvent>(_changeState);
  }

  void _getItem(GetItemEvent event, Emitter<ItemState> emit) {
    _itemList = [
      ItemModel(name: "tea", quantity: "3", id: _uuid.v4()),
      ItemModel(name: "solt", quantity: "3", id: _uuid.v4()),
      ItemModel(name: "paper", quantity: "3", id: _uuid.v4()),
    ];

    emit(ItemLoadedState(itemList: List.from(_itemList)));
  }

  void _addItem(AddItemEvent event, Emitter<ItemState> emit) {
    _itemList.add(
      ItemModel(name: event.name, quantity: event.quantity, id: _uuid.v4()),
    );
    emit(ItemLoadedState(itemList: List.from(_itemList)));
  }

  void _deleteItem(DeleteItemEvent event, Emitter<ItemState> emit) {
    _itemList.removeWhere((element) => element.id == event.ItemId);

    if (_itemList.isEmpty)
      emit(EmptyItemState());
    else
      emit(ItemLoadedState(itemList: List.from(_itemList)));
  }

  void _changeState(ChangetemEvent event, Emitter<ItemState> emit) {
    final item = _itemList.firstWhere((e) => e.id == event.ItemId);

    item.isBought = !item.isBought;

    emit(ItemLoadedState(itemList: List.from(_itemList)));
  }
}
