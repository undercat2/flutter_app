import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_items.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetItems getItems;

  HomeBloc({required this.getItems}) : super(HomeState()) {
    on<HomeItemsRequested>(_onHomeItemsRequested);
  }

  Future<void> _onHomeItemsRequested(
    HomeItemsRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final items = await getItems('home');
      emit(state.copyWith(
        status: HomeStatus.success,
        items: items,
      ));
    } catch (error) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}