import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_project/src/data/datasources/home_datasource.dart';

import '../../../data/repositories/home_repository_impl.dart';
import '../../../domain/entities/data.dart';

final homeDataProvider =
    StateNotifierProvider<HomeNotifier, Data>((ref) => HomeNotifier(getData: ref.watch(homeRepositoryProvider).getHomeData));

typedef DataCallback = Future<Data> Function();

class HomeNotifier extends StateNotifier<Data> {
  HomeNotifier({required this.getData})  : super(Data());
  DataCallback getData;

  Future<void> loadHomeData() async {
    state = await getData();
  }
}

final homeRepositoryProvider = Provider((ref) {
  return HomeRepositoryImpl(homeDataSource: HomeDataSource());
});
