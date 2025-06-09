import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugas_1_aplikasi_x/config/api.dart';

class User {
  int? id;
  String? nama;
  String? email;
  String? password;
  DateTime? tanggal_lahir;
  String? avatar;

  User({
    required this.id,
    required this.nama,
    required this.email,
    required this.password,
    required this.tanggal_lahir,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int? ?? null,
      nama: json['nama'] ?? null,
      email: json['email'] ?? null,
      password: json['password'] ?? null,
      tanggal_lahir: json['tanggal_lahir'] != null
          ? DateTime.parse(json['tanggal_lahir'])
          : null,
      avatar: json['avatar'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id ?? null,
      'nama': this.nama ?? null,
      'email': this.email ?? null,
      'password': this.password ?? null,
      'tanggal_lahir': this.tanggal_lahir?.toIso8601String() ?? null,
    };
  }

  static const String baseUrl = ApiService.baseUrl; // or your IP

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
