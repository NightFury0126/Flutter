import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_boilerplate/shared/constant/K.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter_boilerplate/shared/http/HttpHelper.dart';

class AuthApiProvider {
  final _baseUrl = K.baseUrl;

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      var data = json.encode({'email': email, 'password': password});
      return HttpHelper.post('$_baseUrl/login', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> signUp(
      String email, String password, String name) async {
    try {
      var data = json.encode({"name": name, "email": email, "password": password});
      return HttpHelper.post('$_baseUrl/signup', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }
}

class AuthRepository {
  final authApiProvider = AuthApiProvider();
  Future<Map<String, dynamic>> signIn(String email, String password) =>
      authApiProvider.signIn(email, password);

  Future<Map<String, dynamic>> signUp(
          String email, String password, String name) =>
      authApiProvider.signUp(email, password, name);
}
