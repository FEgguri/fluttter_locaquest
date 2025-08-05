import 'package:dio/dio.dart';
import 'package:fluttter_locaquest/common/constants.dart';

class NaverApiService {
  final Dio _dio = Dio();

  Future<Response> searchLocation(String query) async {
    final response = await _dio.get(
      kBaseUrl,
      queryParameters: {
        'query': query,
        'display': 10,
      },
      options: Options(headers: {
        'X-Naver-Client-Id': kNaverClientId,
        'X-Naver-Client-Secret': kNaverClientSecret,
      }),
    );
    return response;
  }
}
