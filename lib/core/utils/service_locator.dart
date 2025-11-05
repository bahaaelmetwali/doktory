import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:doktory/core/location/cubit/location_cubit_cubit.dart';
import 'package:doktory/core/location/data/data_source/location_data_source.dart';
import 'package:doktory/core/location/data/repo_impl/location_repo_impl.dart';
import 'package:doktory/core/location/domain/usecases/location_use_case.dart';
import 'package:doktory/core/utils/cache_helper.dart';
import 'package:doktory/core/utils/location_api_service.dart';
import 'package:doktory/features/shared/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doktory/features/shared/auth/data/data_source/firebase_auth_service.dart';
import 'package:doktory/features/shared/auth/data/data_source/firestore_user_service.dart';
import 'package:doktory/features/shared/auth/data/data_source/user_remote_data_source.dart';
import 'package:doktory/features/shared/auth/data/repo_impl/auth_repository_Impl.dart';
import 'package:doktory/features/shared/auth/data/repo_impl/user_repository_Impl.dart';
import 'package:doktory/features/shared/auth/domain/usecases/complete_user_data_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/create_user_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_current_user.dart';
import 'package:doktory/features/shared/auth/domain/usecases/login_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/register_use_case.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/auth_check/auth_check_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/complete_user_data_cubit/complete_user_data_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:doktory/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  //location
  final dioLocation = Dio(
    BaseOptions(
      baseUrl: LocationApiService.baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  getIt.registerLazySingleton<LocationApiService>(
    () => LocationApiService(dioLocation),
  );
  getIt.registerLazySingleton<LocationDataSourceImpl>(
    () => LocationDataSourceImpl(getIt<LocationApiService>()),
  );
  getIt.registerLazySingleton<LocationRepoImpl>(
    () => LocationRepoImpl(getIt<LocationDataSourceImpl>()),
  );
  getIt.registerLazySingleton<LocationUseCase>(
    () => LocationUseCase(getIt<LocationRepoImpl>()),
  );
  getIt.registerFactory<LocationCubit>(
    () => LocationCubit(getIt<LocationUseCase>()),
  );
  //firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  //firebase_auth
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(getIt<FirebaseAuth>()),
  );

  getIt.registerLazySingleton<FirestoreUserService>(
    () => FirestoreUserService(getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  //shared_preferences
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<FirebaseAuthService>()),
  );

  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(getIt<FirestoreUserService>()),
  );
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepositoryImpl>()),
  );
  getIt.registerLazySingleton<UserRepositoryImpl>(
    () => UserRepositoryImpl(getIt<UserRemoteDataSource>()),
  );
  getIt.registerLazySingleton<CreateUserUseCase>(
    () => CreateUserUseCase(getIt<UserRepositoryImpl>()),
  );

  getIt.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterUseCase>(), getIt<CreateUserUseCase>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepositoryImpl>()),
  );
  getIt.registerLazySingleton<LogInCubit>(
    () => LogInCubit(getIt<LoginUseCase>()),
  );
  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(getIt<AuthRepositoryImpl>()),
  );
  getIt.registerLazySingleton<AuthCheckCubit>(
    () => AuthCheckCubit(getIt<GetCurrentUserUseCase>()),
  );
  getIt.registerLazySingleton<CompleteUserDataUseCase>(
    () => CompleteUserDataUseCase(getIt<UserRepositoryImpl>()),
  );
  getIt.registerLazySingleton<CompleteUserDataCubit>(
    () => CompleteUserDataCubit(getIt<CompleteUserDataUseCase>()),
  );
}
