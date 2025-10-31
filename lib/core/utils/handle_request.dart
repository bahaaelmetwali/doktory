import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/errors/firebase_failure.dart';
import 'package:doktory/core/errors/service_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Either<Failure, T>> handleRequest<T>({
  required Future<T> Function() request,
}) async {
  try {
    final response = await request();
    return right(response);
  } on FirebaseAuthException catch (e) {
    return left(FirebaseFailure.fromAuth(e));
  } on FirebaseException catch (e) {
    if (e.plugin == 'firebase_storage') {
      return left(FirebaseFailure.fromStorage(e));
    } else {
      return left(FirebaseFailure.fromFirestore(e));
    }
  } on DioException catch (dioError) {
    return left(ServiceFailure.fromDio(dioError));
  } catch (e) {
    return left(Failure(e.toString()));
  }
}
