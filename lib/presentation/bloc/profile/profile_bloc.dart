import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_items.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetItems getItems;

  ProfileBloc({required this.getItems}) : super(ProfileState()) {
    on<ProfileItemsRequested>(_onProfileItemsRequested);
  }

  Future<void> _onProfileItemsRequested(
    ProfileItemsRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final items = await getItems('profile');
      emit(state.copyWith(
        status: ProfileStatus.success,
        items: items,
      ));
    } catch (error) {
      emit(state.copyWith(status: ProfileStatus.failure));
    }
  }
}