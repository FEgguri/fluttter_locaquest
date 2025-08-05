import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttter_locaquest/models/location.dart';
import 'package:fluttter_locaquest/repositories/location_repository.dart';
import 'package:fluttter_locaquest/sevices/naver_api_service.dart';

final locationViewModelProvider =
    StateNotifierProvider<LocationViewModel, AsyncValue<List<Location>>>((ref) {
  return LocationViewModel(LocationRepository(NaverApiService()));
});

class LocationViewModel extends StateNotifier<AsyncValue<List<Location>>> {
  final LocationRepository repository;

  LocationViewModel(this.repository) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    try {
      final results = await repository.search(query);
      state = AsyncValue.data(results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
