import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:doktory/core/location/cubit/location_cubit_cubit.dart';
import 'package:doktory/core/location/data/data_source/location_data_source.dart';
import 'package:doktory/core/location/data/repo_impl/location_repo_impl.dart';
import 'package:doktory/core/location/domain/usecases/location_use_case.dart';
import 'package:doktory/core/utils/cache_helper.dart';
import 'package:doktory/core/utils/location_api_service.dart';
import 'package:doktory/features/shared/auth/data/data_source/auth_remote_data_source.dart';

import 'package:doktory/features/shared/auth/data/data_source/user_remote_data_source.dart';
import 'package:doktory/features/shared/auth/data/repo_impl/auth_repository_Impl.dart';
import 'package:doktory/features/shared/auth/data/repo_impl/user_repository_Impl.dart';
import 'package:doktory/features/shared/auth/domain/usecases/complete_user_data_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/create_user_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_current_user.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/login_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/register_use_case.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/auth_check/auth_check_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/complete_user_data_cubit/complete_user_data_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:doktory/features/user/doctor_details/data/data_source/appointment_service.dart';
import 'package:doktory/features/user/doctor_details/data/data_source/repo_impl/appointments_repository_impl.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/add_appointment_use_case.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_full_user_data_use_case.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/appointment/appointment_cubit.dart';
import 'package:doktory/features/user/home/data/data_source/doctor_remote_data_source.dart';
import 'package:doktory/features/user/home/data/repo_impl/doctor_repository_impl.dart';
import 'package:doktory/features/user/home/domain/usecases/get_doctors_use_case.dart';
import 'package:doktory/features/user/home/presentation/cubits/all_doctors/all_doctors_cubit.dart';
import 'package:doktory/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // 🗺️ إعدادات الـ Location API
  final dioLocation = Dio(
    BaseOptions(
      baseUrl: LocationApiService.baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  // 🌍 Services خاصة بالـ Location
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

  // 🔥 تهيئة Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 🧱 Firebase Instances
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // 🌐 Remote Data Sources (مصادر البيانات)
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(firebaseAuth: getIt<FirebaseAuth>()),
  );

  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<DoctorRemoteDataSource>(
    () => DoctorRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<AppointmentsRemoteDataSource>(
    () =>
        AppointmentsRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );

  // 💾 Shared Preferences (التخزين المحلي)
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(getIt<SharedPreferences>()),
  );

  // 🏗️ Repository Implementations (الريبو الفعلي)
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<UserRepositoryImpl>(
    () => UserRepositoryImpl(getIt<UserRemoteDataSource>()),
  );
  getIt.registerLazySingleton<DoctorRepositoryImpl>(
    () => DoctorRepositoryImpl(getIt<DoctorRemoteDataSource>()),
  );
  getIt.registerLazySingleton<AppointmentsRepositoryImpl>(
    () => AppointmentsRepositoryImpl(getIt<AppointmentsRemoteDataSource>()),
  );
  // ⚙️ Use Cases (منطق الأعمال)
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepositoryImpl>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepositoryImpl>()),
  );

  getIt.registerLazySingleton<CreateUserUseCase>(
    () => CreateUserUseCase(getIt<UserRepositoryImpl>()),
  );

  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(getIt<AuthRepositoryImpl>()),
  );

  getIt.registerLazySingleton<GetUserDataUseCase>(
    () => GetUserDataUseCase(getIt<UserRepositoryImpl>()),
  );

  getIt.registerLazySingleton<CompleteUserDataUseCase>(
    () => CompleteUserDataUseCase(getIt<UserRepositoryImpl>()),
  );
  getIt.registerLazySingleton<GetDoctorsUseCase>(
    () => GetDoctorsUseCase(getIt<DoctorRepositoryImpl>()),
  );
  getIt.registerLazySingleton<AddAppointmentUseCase>(
    () => AddAppointmentUseCase(getIt<AppointmentsRepositoryImpl>()),
  );
  getIt.registerLazySingleton<GetFullUserDataUseCase>(
    () => GetFullUserDataUseCase(
      getIt<AuthRepositoryImpl>(),
      getIt<UserRepositoryImpl>(),
    ),
  );

  // 🧠 Cubits (حالة واجهة المستخدم)
  getIt.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterUseCase>(), getIt<CreateUserUseCase>()),
  );

  getIt.registerLazySingleton<LogInCubit>(
    () => LogInCubit(getIt<LoginUseCase>()),
  );

  getIt.registerLazySingleton<AuthCheckCubit>(
    () => AuthCheckCubit(
      getCurrentUser: getIt<GetCurrentUserUseCase>(),
      getUserDataUseCase: getIt<GetUserDataUseCase>(),
    ),
  );

  getIt.registerLazySingleton<CompleteUserDataCubit>(
    () => CompleteUserDataCubit(getIt<CompleteUserDataUseCase>()),
  );
  getIt.registerFactory(
    () => AllDoctorsCubit(getDoctorsUseCase: getIt<GetDoctorsUseCase>()),
  );
  getIt.registerLazySingleton<AppointmentCubit>(
    () => AppointmentCubit(
      addAppointmentUseCase: getIt<AddAppointmentUseCase>(),
      getFullUserDataUseCase: getIt<GetFullUserDataUseCase>(),
    ),
  );
}
