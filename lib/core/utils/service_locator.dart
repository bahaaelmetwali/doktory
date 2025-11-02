import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doktory/core/utils/cache_helper.dart';
import 'package:doktory/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doktory/features/auth/data/data_source/firebase_auth_service.dart';
import 'package:doktory/features/auth/data/repo_impl/auth_repository_Impl.dart';
import 'package:doktory/features/auth/domain/usecases/register_use_case.dart';
import 'package:doktory/features/auth/presentation/cubits/cubit/register_cubit.dart';
import 'package:doktory/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
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
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepositoryImpl>()),
  );
  getIt.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterUseCase>()),
  );
}
