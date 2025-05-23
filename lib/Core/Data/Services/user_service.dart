import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/app_repo.dart';

import './services_helper.dart';

class UserService extends ServicesHelper {
  Future<List<User>> fetchAllUsers() async {
    final mappedData = await request(
      '$baseURL/users',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return mappedData != null
        ? [for (final mappedUsers in mappedData) User.fromJson(mappedUsers)]
        : [];
  }

  Future<Map<String, dynamic>?> updateUserData(
      Map<String, dynamic> userData) async {
    final mappedData = await request(
      '$baseURL/users',
      serviceType: ServiceType.put,
      body: userData,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>> getUserData() async {
    final mappedData = await request(
      '$baseURL/users/${AppRepo().user!.id}',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>> getAnotherUserData(String userId) async {
    final mappedData = await request(
      '$baseURL/users/$userId',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>?> softDeleteUserRequest(
      {bool useRecoveryEmail = false}) async {
    final mappedData = await request(
      '$baseURL/users/soft-delete-request?useRecoveryEmail=$useRecoveryEmail',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>?> softAnanymizedDeleteUserRequest(
      {bool useRecoveryEmail = false}) async {
    final mappedData = await request(
      '$baseURL/users/soft-anonymized-delete-request?useRecoveryEmail=$useRecoveryEmail',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>?> softKeepDataDeleteUserRequest(
      {bool useRecoveryEmail = false}) async {
    final mappedData = await request(
      '$baseURL/users/soft-keepdata-delete-request?useRecoveryEmail=$useRecoveryEmail',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>?> verifyDelete(
    String code, {
    required bool keepData,
    bool useRecoveryEmail = false,
  }) async {
    final mappedData = await request(
      '$baseURL/users/verify-soft-delete?keep_data=$keepData&useRecoveryEmail=$useRecoveryEmail',
      serviceType: ServiceType.delete,
      body: {
        'code': code,
      },
      requiredDefaultHeader: true,
    );

    return mappedData;
  }
}
