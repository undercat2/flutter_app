import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_items.dart';
import 'explore_event.dart';
import 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetItems getItems;

  ExploreBloc({required this.getItems}) : super(ExploreState()) {
    on<ExploreItemsRequested>(_onExploreItemsRequested);
  }

  Future<void> _onExploreItemsRequested(
    ExploreItemsRequested event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(status: ExploreStatus.loading));
    try {
      final items = await getItems('explore');
      emit(state.copyWith(
        status: ExploreStatus.success,
        items: items,
      ));
    } catch (error) {
      emit(state.copyWith(status: ExploreStatus.failure));
    }
  }
}