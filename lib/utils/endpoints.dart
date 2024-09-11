// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';

class Endpoints {
  static final client = Dio();
  static const API_VERSION = "/api/v1";
  static const BASE = "http://localhost:3000$API_VERSION";
  
  static const LOGIN = "$BASE/auth/signin";
  static const REGISTRATION = "$BASE/auth/signup";
  static const PRODUCTS = "$BASE/products";
}