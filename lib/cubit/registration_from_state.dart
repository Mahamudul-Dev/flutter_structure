part of 'registration_from_cubit.dart';

@immutable
sealed class RegistrationFromState {}

final class RegistrationFromInitial extends RegistrationFromState {}

final class RoleUpdated extends RegistrationFromState {
  final String role;
  RoleUpdated(this.role);
}
