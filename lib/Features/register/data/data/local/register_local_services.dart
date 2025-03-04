import 'dart:convert';

import 'package:idealize_new_version/Core/Constants/local_cache_keys.dart';
import 'package:idealize_new_version/Core/Data/LocalCache/local_secure_cache_helper.dart';

class RegisterLocalServices extends LocalSecureCacheHelper {
  Future<void> updateUser(Map<String, dynamic> updatedUserData) async {
    await LocalSecureCacheHelper()
        .write(LocalSecureCacheKeys().userObject, jsonEncode(updatedUserData));
  }
}