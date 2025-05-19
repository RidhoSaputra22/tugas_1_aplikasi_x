import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String nama;
  String email;
  String password;
  String tanggal_lahir;

  User({
    required this.nama,
    required this.email,
    required this.password,
    required this.tanggal_lahir,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nama: json['nama'],
      email: json['email'],
      password: json['password'],
      tanggal_lahir: json['tanggal_lahir'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'password': password,
      'tanggal_lahir': tanggal_lahir,
    };
  }

  static const String baseUrl = 'http://localhost:3000'; // or your IP

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode != 200) throw Exception('Failed to add user');
  }

  static Future<void> editUser(int id, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode != 200) throw Exception('Failed to update user');
  }

  static Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode != 200) throw Exception('Failed to delete user');
  }

  /// 🔍 Find a user by ID
  static Future<User?> findById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return User.fromJson(data);
    } else if (response.statusCode == 404) {
      return null; // not found
    } else {
      throw Exception('Failed to find user by ID');
    }
  }

  /// 🔎 Find users by name/email (basic search)
  static Future<List<User>> find(String keyword) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/search?q=${keyword}'),
    );
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search users');
    }
  }
}
