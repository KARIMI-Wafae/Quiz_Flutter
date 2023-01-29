import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_testing/models/http_exception.dart';

class Authentification with ChangeNotifier{
  Future<void> signUp(String email,String password) async{

      const  url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBJZ2EYNZWCUjcCifJsANUcHYmwkVRi90A';
    try{
      final response =  await http.post(Uri.parse(url), body: json.encode(
          {
            'email' :email,
            'password':password,
            'returnSecureToken':true,
          }
      ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        throw httpException(responseData['error']['message']);
      }
    //  print(responseData);
    }catch (error){
    throw error;
    }

  }

  Future<void> logIn(String email,String password) async{

    const  url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBJZ2EYNZWCUjcCifJsANUcHYmwkVRi90A';
    try{
      final response =  await http.post(Uri.parse(url), body: json.encode(
          {
            'email' :email,
            'password':password,
            'returnSecureToken':true,
          }
      ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
          throw httpException(responseData['error']['message']);
      }
     // print(responseData);
    }catch(error){
      throw error;
    }

  }
}