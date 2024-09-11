import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/models/registration_response_model.dart';
import 'package:flutter_structure/repository/auth_repository.dart';
import 'package:meta/meta.dart';

import '../models/error_model.dart';
import '../models/registration_form_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthBloc(this.repository) : super(AuthInitial()) {

    on<Login>((event, emit) async {
      if(event.email == ''){
        emit(Failed("Email is required"));
        return;
      }
      if(event.password == ''){
        emit(Failed("Password is required"));
        return;
      }



      emit(Loading());
      try {
        final result = await repository.login(event.email, event.password);

      if(result is RegistrationResponseModel){
        emit(Success("User logged in"));
      } else {
        emit(Failed((result as ErrorModel).error));
      }
      } catch (e) {
        emit(Failed(e.toString()));
      }
    });


    on<Registration>((event, emit) async {

      print(
        event.data.toJson()
      );
      emit(Loading());
      try {
        final result = await repository.registration(event.data);

      if(result is RegistrationResponseModel){
        emit(Success("User created success. User name: ${result.user?.name}"));
      } else {
        emit(Failed((result as ErrorModel).error));
      }
      } catch (e) {
        emit(Failed(e.toString()));
      }
    });

  }
}
