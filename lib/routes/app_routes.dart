part of 'app_pages.dart';

class AppRoutes {
  static const RouteModel LOGIN = RouteModel('/login', 'login');
  static const RouteModel REGISTRATION = RouteModel('/registration', 'registration');
  static const RouteModel HOME = RouteModel('/', 'home');
}


class RouteModel {
  final String path;
  final String name;
  const RouteModel(this.path, this.name);
}