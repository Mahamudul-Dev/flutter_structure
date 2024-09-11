


import 'package:dio/dio.dart';
import 'package:flutter_structure/utils/endpoints.dart';

class AuthNetwork {
  
  
  Future<Response> requestRegistration(Map<String, dynamic> body) async {
    try {
      final result = await Endpoints.client.post(Endpoints.REGISTRATION, data: body);
    return result;
    } catch (e) {
      throw Exception(e);
    }
  }


  Future<Response> requestLogin(Map<String, dynamic> body) async {
    try {
      final result = await Endpoints.client.post(Endpoints.LOGIN, data: body);

    return result;
    } catch (e) {
      throw Exception(e);
    }
  }


}