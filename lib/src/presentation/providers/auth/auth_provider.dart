import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/controller/auth_controller.dart';
import '../../../core/service/auth_service.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(AuthService());
});
