import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/config/api.dart';
import 'package:tugas_1_aplikasi_x/main.dart';
import 'package:tugas_1_aplikasi_x/models/Post.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';

class MyAddPost extends StatefulWidget {
  final User user;
  const MyAddPost({super.key, required this.user});

  @override
  State<MyAddPost> createState() => _MyAddPostState();
}

class _MyAddPostState extends State<MyAddPost> {
  final TextEditingController bodyController = TextEditingController();

  FilePickerResult? photo;
  double? height;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    height = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.user.avatar ??
                    "${ApiService.baseUrl}/file/users/default.png"), // Use user's photo
              ),
              const SizedBox(width: 12),
              // Text Field
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: bodyController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "What's happening?",
                        border: InputBorder.none,
                      ),
                    ),
                    this.photo != null
                        ? Image.memory(
                            this.photo!.files.first.bytes!,
                            // width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.image_outlined),
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.image);
                    if (result != null) {
                      setState(() {
                        this.height = 300;
                        this.photo = result;
                      });
                    }
                  }),
              IconButton(
                  icon: const Icon(Icons.gif_box_outlined), onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.poll_outlined), onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.schedule_outlined), onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.location_on_outlined),
                  onPressed: () {}),
              const Spacer(),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        String? photoUrl = null;
                        if (this.photo != null)
                          photoUrl = await Post.uploadPhoto(this.photo!);
                        print(bodyController.text);
                        var response = await Post.addPost(Post(
                          id: null,
                          body: bodyController.text,
                          photo: photoUrl,
                          created_at: null,
                          user: widget.user,
                        ));
                        if (response.statusCode == 200) {
                          this.height = 100;
                          this.bodyController.clear();
                          this.photo = null;
                        }
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                      isLogin: true,
                                      user: widget.user,
                                    )));
                      }, // Enable when user types something
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("Post"),
                    )
            ],
          )
        ],
      ),
    );
  }
}
