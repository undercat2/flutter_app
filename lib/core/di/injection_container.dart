import 'package:get_it/get_it.dart';
import '../../data/repositories/item_repository_impl.dart';
import '../../domain/repositories/item_repository.dart';
import '../../domain/usecases/get_items.dart';
import '../../presentation/bloc/navigation/navigation_bloc.dart';
import '../../presentation/bloc/home/home_bloc.dart';
import '../../presentation/bloc/explore/explore_bloc.dart';
import '../../presentation/bloc/profile/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => NavigationBloc());
  sl.registerFactory(() => HomeBloc(getItems: sl()));
  sl.registerFactory(() => ExploreBloc(getItems: sl()));
  sl.registerFactory(() => ProfileBloc(getItems: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetItems(sl()));

  // Repository
  sl.registerLazySingleton<ItemRepository>(() => ItemRepositoryImpl());
}
