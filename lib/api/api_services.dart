import 'package:emart_app/model/brandmodel/mdlbrand.dart';
import 'package:emart_app/model/mdlRegister.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:emart_app/api/api_endpoint.dart';
import 'package:emart_app/repo/loginrepo.dart';
import 'package:emart_app/model/mdlLogin.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import file api_endpoint.dart

class UserService {
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}

class ApiServices {
  Future<getLogin?> login(LoginRepo loginData) async {
    final response = await http.post(
      Uri.parse(ApiEndpoint.login),
      body: loginData.toJson(),
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      getLogin loginResponse = getLogin.fromJson(json.decode(responseString));

      // Access token and userId from 'data' property
      String? token = loginResponse.data?.token;
      int? userId = loginResponse.data?.id; // Handle user ID as an integer

      // Save token and userId to shared preferences or other storage
      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
      }
      if (userId != null) {
        await UserService.saveUserId(
            userId.toString()); // Save the user ID as a string
      }

      return loginResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<getLogin?> register(RegisterModel registerData) async {
    final response = await http.post(
      Uri.parse(ApiEndpoint.register),
      body: registerData.toJson(),
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      getLogin registerResponse =
          getLogin.fromJson(json.decode(responseString));

      // Mengakses token dari properti 'data'
      String? token = registerResponse.data?.token;

      // Simpan token ke shared preferences atau tempat penyimpanan lainnya
      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
      }

      return registerResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<getBrand?> getBrands(String token) async {
    final response = await http.get(
      Uri.parse(ApiEndpoint.getBrand), // Ganti dengan endpoint brands Anda
      headers: {
        'Authorization': 'Bearer $token', // Tambahkan ini
      },
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      getBrand brandsResponse = getBrand.fromJson(json.decode(responseString));
      return brandsResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Anda bisa menambahkan metode lainnya di sini
}
