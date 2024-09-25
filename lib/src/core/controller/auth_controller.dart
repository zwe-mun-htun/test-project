
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/auth_service.dart';

enum AuthState { authenticated, unauthenticated, loading, error }

class AuthController extends StateNotifier<AuthState> {
  final AuthService _authService;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthController(this._authService) : super(AuthState.unauthenticated) {
    _checkAuthState();
  }

  //Check Auth State
  Future<void> _checkAuthState() async {
    final token = await _authService.getToken();
    if (token != null) {
      state = AuthState.authenticated;
    } else {
      state = AuthState.unauthenticated;
    }
  }

  //Login
  Future<void> login(String username, String password) async {
    state = AuthState.loading;
    try {
      final token = await _authService.login(username, password);
      if (token != null) {
        // Save token to secure storage
        await _secureStorage.write(key: 'token', value: token);
        state = AuthState.authenticated;
      } else {
        state = AuthState.error;
      }
    } catch (e) {
      state = AuthState.error;
    }
  }

  //Logout
  void logout() async{
    state = AuthState.unauthenticated;
    // Clear token from secure storage
    await _secureStorage.delete(key: 'token');
  }
}