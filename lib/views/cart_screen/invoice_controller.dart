import 'package:emart_app/api/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:emart_app/model/mdlNota.dart'; // Import model getNota

class InvoiceController {
  Future<getNota?> getInvoice(int userId, String token) async {
    final url = 'http://192.168.1.8:8080/api/tampil/$userId';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print('Data berhasil diambil: $responseData');
        return getNota.fromJson(responseData);
      } else {
        print('Gagal mengambil data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
