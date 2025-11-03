import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/location/data/data_source/location_data_source.dart';
import 'package:doktory/core/location/domain/entities/location_entity.dart';
import 'package:doktory/core/location/domain/repos/location_repo.dart';
import 'package:doktory/core/utils/handle_request.dart';

class LocationRepoImpl implements LocationRepo {
  final LocationDataSource dataSource;
  LocationRepoImpl(this.dataSource);
  @override
  Future<Either<Failure, LocationEntity>> getLocation({
    required double latitude,
    required double longitude,
    String language = 'ar',
  }) async {
    return handleRequest<LocationEntity>(
      request: () async {
        final response = await dataSource.getLocation(
          latitude: latitude,
          longitude: longitude,
          language: language,
        );
        return response.toEntity();
      },
    );
  }
}
