import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService{
  String _baseUrl='https://www.googleapis.com/books/v1/';
  Dio dio;
  ApiService(this.dio);
  Future<Map<String,dynamic>> get({required String endPoint})async{
    final respone= await dio.get('$_baseUrl$endPoint');
    return respone.data;
  }
}