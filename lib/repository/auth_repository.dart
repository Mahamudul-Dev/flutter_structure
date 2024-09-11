import 'dart:convert';

import 'package:flutter_structure/models/error_model.dart';
import 'package:flutter_structure/models/registration_form_model.dart';
import 'package:flutter_structure/models/registration_response_model.dart';
import 'package:flutter_structure/network/auth_network.dart';

class AuthRepository {
  final AuthNetwork network;

  AuthRepository(this.network);


  Future registration(RegistrationFormModel data) async {
    try {
      final response = await network.requestRegistration(data.toJson());

    print(response.data);

    if(response.statusCode == 201){
      return RegistrationResponseModel.fromJson(response.data);
    } else {
      return ErrorModel.fromJson(response.data);
    }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }


  Future login(String email, String password) async {
    try {
      final response = await network.requestLogin({'email': email, 'password': password});
    print(response.data);

    if(response.statusCode == 201){
      return RegistrationResponseModel.fromJson(response.data);
    } else {
      return ErrorModel.fromJson(response.data);
    }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}