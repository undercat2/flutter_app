import 'package:equatable/equatable.dart';
import '../../../domain/entities/item.dart';

enum ProfileStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  final ProfileStatus status;
  final List<Item> items;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.items = const [],
  });

  ProfileState copyWith({
    ProfileStatus? status,
    List<Item>? items,
  }) {
    return ProfileState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [status, items];
}