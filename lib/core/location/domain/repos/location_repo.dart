import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/location/domain/entities/location_entity.dart';

abstract class LocationRepo {
  Future<Either<Failure, LocationEntity>> getLocation({
    required double latitude,
    required double longitude,
    String language = 'ar',
  });
}
