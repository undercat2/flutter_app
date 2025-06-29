import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;

  const Item({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
  });

  @override
  List<Object> get props => [id, title, description, imageUrl, category];
}
