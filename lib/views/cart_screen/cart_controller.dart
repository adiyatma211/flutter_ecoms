import 'package:emart_app/api/api_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;
  final String token;

  CartController(this.token) {
    assert(token != null, 'Token cannot be null');
  }

  void addItemToCart(
    String title,
    String price,
    int quantity,
  ) {
    if (title != null && price != null && quantity != null) {
      var item = {
        'title': title,
        'price': price,
        'quantity': quantity,
      };
      cartItems.add(item);
      print(cartItems);
    } else {
      print('Error: Invalid item data');
    }
  }

  Future<void> pay() async {
    const url = 'http://192.168.1.8:8080/api/simpan';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final String? userId = await UserService.getUserId();
    if (userId == null) {
      Get.snackbar('Error', 'User ID not found');
      return;
    }

    List<Map<String, dynamic>> transactions = cartItems.map((item) {
      double total = double.parse(item['price']) * item['quantity'];

      return {
        'user_id': userId, // Include the user ID here
        'nama': item['nama'],
        'alamat': item['alamat'],
        'title': item['title'],
        'quantity': item['quantity'],
        'total': total.toStringAsFixed(2),
        'pengiriman': item['pengiriman'],
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      };
    }).toList();

    final body = jsonEncode(transactions);

    print('Items to be paid: $transactions');

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Payment processed successfully');
        cartItems.clear();
      } else {
        Get.snackbar('Error', 'Payment failed: ${response.body}');
        print('Error: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
      print('Exception: $e');
    }
  }

  Future<void> saveToDatabase(
      String nama, String total, Map<String, dynamic> item) async {
    final String? userId = await UserService.getUserId();
    if (userId == null) {
      Get.snackbar('Error', 'User ID not found');
      return;
    }

    final Map<String, dynamic> data = {
      'user_id': userId, // Include the user ID here
      'title': item['title'],
      'price': item['price'],
      'quantity': item['quantity'],
      'nama': nama,
      'total': total,
      'alamat': item['alamat'],
      'pengiriman': item['pengiriman'],
    };

    final String url = 'http://192.168.1.8:8080/api/simpan';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Item Berhasil Di Bayar');
      } else {
        Get.snackbar('Error', 'Failed to save item to database');
        print('Error: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
      print('Exception: $e');
    }
  }
}
