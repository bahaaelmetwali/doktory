import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/location/domain/entities/location_entity.dart';
import 'package:doktory/core/location/domain/repos/location_repo.dart';

class LocationUseCase {
  LocationRepo locationRepo;
  LocationUseCase(this.locationRepo);
  Future<Either<Failure, LocationEntity>> call({
    required double latitude,
    required double longitude,
    String language = 'ar',
  }) async {
    return await locationRepo.getLocation(
      latitude: latitude,
      longitude: longitude,
      language: language,
    );
  }
}
