import 'package:doktory/core/location/cubit/location_cubit_state.dart';
import 'package:doktory/core/location/domain/usecases/location_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationUseCase locationUseCase;

  LocationCubit(this.locationUseCase) : super(LocationInitial());

  Future<void> getLocation({
    required double latitude,
    required double longitude,
    String language = 'ar',
  }) async {
    emit(LocationLoading());
    final result = await locationUseCase(
      latitude: latitude,
      longitude: longitude,
      language: language,
    );

    result.fold(
      (failure) => emit(LocationError(failure.toString())),
      (location) => emit(LocationLoaded(location)),
    );
  }
}
