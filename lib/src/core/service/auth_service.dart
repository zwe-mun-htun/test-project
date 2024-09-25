import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/src/config/constants/constants.dart';

class AuthService {
  final http.Client _client;

  // Initialize the HTTP client
  AuthService([http.Client? client])
      : _client = client ?? http.Client();

  // Login
  Future<String?> login(String username, String password) async {
    try {
      final response = await _client.post(
        Uri.parse(AppConstants.loginPath),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['token'];
      } else {
        debugPrint('Login failed: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Login error: $e');
      return null;
    }
  }

  // Get token from secure storage
  Future<String?> getToken() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: 'token');
  }
}
