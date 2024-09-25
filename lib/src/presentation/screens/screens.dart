library screens;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/router/route_path.dart';
import '../../core/controller/auth_controller.dart';
import '../providers/auth/auth_provider.dart';
import '../providers/home/home_provider.dart';
import '../values/strings.dart';

part 'home/home_screen.dart';
part 'login/login_screen.dart';