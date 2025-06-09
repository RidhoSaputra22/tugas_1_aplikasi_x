import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tugas_1_aplikasi_x/config/api.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';
import 'package:http/http.dart' as http;

String baseUrl = ApiService.baseUrl;

class Post {
  final int? id;
  final String body;
  final String? photo;
  final DateTime? created_at;
  final User user;

  Post({
    required this.id,
    required this.body,
    required this.photo,
    required this.created_at,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? null,
      body: json['body'] ?? '',
      photo: json['photo'] ?? '',
      created_at:
          DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'body': this.body,
        'photo': this.photo,
        'created_at': this.created_at?.toIso8601String() ?? null,
        'user': this.user.toJson(),
      };

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  static Future<http.Response> addPost(
    Post post,
  ) async {
    print(json.encode(post.toJson()));
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );
    // if (response.statusCode != 200) throw Exception('Failed to add post');
    return response;
  }

  static Future<String> uploadPhoto(FilePickerResult photo) async {
    try {
      final formData = FormData.fromMap({
        'photo': MultipartFile.fromBytes(
          photo.files.first.bytes!,
          filename: photo.files.first.name,
        ),
      });

      var res = await Dio().post(
        '${baseUrl}/file/posts',
        data: formData,
      );

      if (res.statusCode != 200)
        throw Exception('Failed to upload photo: ${res.data}');

      return res.data['photo'];
    } catch (e) {
      throw Exception('Failed to upload photo: $e');
    }
  }
}
