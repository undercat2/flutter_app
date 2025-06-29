import 'package:equatable/equatable.dart';
import '../../../domain/entities/item.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Item> items;

  const HomeState({
    this.status = HomeStatus.initial,
    this.items = const [],
  });

  HomeState copyWith({
    HomeStatus? status,
    List<Item>? items,
  }) {
    return HomeState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [status, items];
}