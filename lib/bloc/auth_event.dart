part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


final class Login extends AuthEvent {
  final String email;
  final String password;

  Login(this.email, this.password);

}


final class Registration extends AuthEvent {
  final RegistrationFormModel data;
  Registration(this.data);
}
