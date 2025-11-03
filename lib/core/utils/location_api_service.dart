import 'package:dio/dio.dart';

class LocationApiService {
  static const String baseUrl = 'https://us1.locationiq.com/v1/';
  static const String apiKey = 'pk.96996f6c91c587302212324765af2f03';

  final Dio _dio;

  LocationApiService(this._dio);

  Future<Map<String, dynamic>> getReverseGeocode({
    required double lat,
    required double lon,
    String language = 'ar',
  }) async {
    final response = await _dio.get(
      'reverse',
      queryParameters: {
        'key': apiKey,
        'lat': lat,
        'lon': lon,
        'format': 'json',
        'accept-language': language,
      },
    );

    return response.data;
  }
}