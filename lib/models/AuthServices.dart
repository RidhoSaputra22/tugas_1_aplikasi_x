import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://localhost:3000';

  static Future<bool> register({
    required String nama,
    required String email,
    required String password,
    required String tanggalLahir,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "nama": nama,
        "email": email,
        "password": password,
        "tanggal_lahir": tanggalLahir,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print(json.decode(response.body));
      return false;
    }
  }

  static Future<Map<String, dynamic>?> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "email": email,
        "password": password,
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
