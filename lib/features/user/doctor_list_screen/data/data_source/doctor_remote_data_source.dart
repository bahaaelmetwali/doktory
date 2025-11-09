import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/doctor_list_screen/data/data_source/firestore_doctor_service.dart';

class DoctorRemoteDataSource {
  final FirestoreDoctorService firestoreDoctorService;

  DoctorRemoteDataSource({required this.firestoreDoctorService});

  Future<List<UserModel>> getDoctors() async {
    return await firestoreDoctorService.getDoctors();
  }
}
