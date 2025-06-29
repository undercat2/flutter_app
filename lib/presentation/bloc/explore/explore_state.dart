import 'package:equatable/equatable.dart';
import '../../../domain/entities/item.dart';

enum ExploreStatus { initial, loading, success, failure }

class ExploreState extends Equatable {
  final ExploreStatus status;
  final List<Item> items;

  const ExploreState({
    this.status = ExploreStatus.initial,
    this.items = const [],
  });

  ExploreState copyWith({
    ExploreStatus? status,
    List<Item>? items,
  }) {
    return ExploreState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [status, items];
}