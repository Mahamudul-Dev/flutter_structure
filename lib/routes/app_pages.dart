import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screens/screen.dart';

part 'app_routes.dart';


class AppPages {
  static final router = GoRouter(
    initialLocation: AppRoutes.LOGIN.path,
    routes: [
    GoRoute(path: AppRoutes.LOGIN.path, name: AppRoutes.LOGIN.name, pageBuilder: (context, state) => const MaterialPage(child: LoginScreen()),),
    GoRoute(path: AppRoutes.REGISTRATION.path, name: AppRoutes.REGISTRATION.name, pageBuilder: (context, state) => const MaterialPage(child: RegistrationScreen()),),
    GoRoute(path: AppRoutes.HOME.path, name: AppRoutes.HOME.name, pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),),
  ]);
}