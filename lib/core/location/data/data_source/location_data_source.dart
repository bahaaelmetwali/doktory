import 'package:doktory/core/location/data/models/location_response_model.dart';
import 'package:doktory/core/utils/location_api_service.dart';

abstract class LocationDataSource {
  Future<LocationResponseModel> getLocation({
    required double latitude,
    required double longitude,
    String language,
  });
}

class LocationDataSourceImpl implements LocationDataSource {
  final LocationApiService locationApiService;
  LocationDataSourceImpl(this.locationApiService);
  @override
  Future<LocationResponseModel> getLocation({
    required double latitude,
    required double longitude,
    String language = 'ar',
  }) async {
    final response = await locationApiService.getReverseGeocode(
      lat: latitude,
      lon: longitude,
      language: language,
    );
    return LocationResponseModel.fromJson(response);
  }
}
