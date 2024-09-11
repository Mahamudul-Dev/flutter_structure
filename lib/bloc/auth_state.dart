part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Failed extends AuthState {
  final String message;

  Failed(this.message);
}

final class Success extends AuthState {
  final String message;
  Success(this.message);

}

final class Loading extends AuthState {}