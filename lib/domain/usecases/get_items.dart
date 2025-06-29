import '../entities/item.dart';
import '../repositories/item_repository.dart';

class GetItems {
  final ItemRepository repository;

  GetItems(this.repository);

  Future<List<Item>> call(String category) async {
    return await repository.getItems(category);
  }
}
