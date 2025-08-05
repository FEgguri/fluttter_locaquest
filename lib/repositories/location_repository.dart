import 'package:fluttter_locaquest/models/location.dart';
//
import 'package:fluttter_locaquest/sevices/naver_api_service.dart';

class LocationRepository {
  final NaverApiService apiService;

  LocationRepository(this.apiService);

  Future<List<Location>> search(String query) async {
    final response = await apiService.searchLocation(query);
    final List items = response.data['items'];
    return items.map((e) => Location.fromJson(e)).toList();
  }
}
