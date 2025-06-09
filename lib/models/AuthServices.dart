import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugas_1_aplikasi_x/config/api.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';

class AuthService {
  static const String baseUrl = ApiService.baseUrl;

  static Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print(json.decode(response.body));
      return false;
    }
  }

  static Future<Map<String, dynamic>?> login(
      String? email, String? password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "email": email ?? "",
        "password": password ?? "",
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      print(response.body);
      print(json.decode(response.body));
      return null;
    }
  }
}
