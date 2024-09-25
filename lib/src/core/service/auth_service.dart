import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_project/src/config/constants/constants.dart';

class AuthService {
  final Dio _dio;

  //Initialize Dio instance with base url
  AuthService([Dio? dio])
      : _dio = dio ?? Dio(BaseOptions(baseUrl: AppConstants.kBaseURL));

  //Login
  Future<String?> login(String username, String password) async {
    try {
      final response = await _dio.post(AppConstants.loginPath, data: {
        'username': username,
        'password': password,
      });
      return response.statusCode == 200 ? response.data['token'] : null;
    } on DioException catch (e) {
      String message = e.response?.data ?? e.message;
      debugPrint('Login failed: $message');
      return null;
    } catch (e) {
      debugPrint('Login error: $e');
      return null;
    }
  }

  Future<String?> getToken() async {
    // Retrieve token from secure storage
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: 'token');
  }
}
