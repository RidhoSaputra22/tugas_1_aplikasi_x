import 'dart:io';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:tugas_1_aplikasi_x/models/Post.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyPost.dart';

void main() {
  // Post post = Post(
  //   id: null,
  //   created_at: null,
  //   body: "body",
  //   photo: "body",
  //   user: User(
  //       id: 1,
  //       nama: null,
  //       password: null,
  //       email: null,
  //       tanggal_lahir: null,
  //       avatar: null),
  // );

  // print(post.toJson());

  if (kIsWeb) {
    FilePickerWeb.registerWith(Registrar());
    WidgetsFlutterBinding.ensureInitialized();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PostTest());
  }
}

class PostTest extends StatelessWidget {
  const PostTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Test"),
      ),
      body: FutureBuilder<List<Post>>(
        future: Post.fetchPosts(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Container(
              child: MyPost(post: snapshot.data![index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPost()),
          );
        },
      ),
    );
  }
}

class AddPost extends StatefulWidget {
  AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController bodyController = TextEditingController();

  FilePickerResult? photo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: bodyController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "What's on your mind?",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  setState(() {
                    this.photo = result;
                  });
                } else {
                  // User canceled the picker
                }
              },
              child: Text("Add Photo")),
          Row(
            children: [
              Spacer(),
              TextButton(
                onPressed: () async {
                  String photoUrl = await Post.uploadPhoto(photo!);

                  print(photoUrl);

                  await Post.addPost(
                    Post(
                      id: null,
                      created_at: null,
                      body: bodyController.text,
                      photo: photoUrl,
                      user: User(
                          id: 1,
                          email: "email",
                          password: "password",
                          nama: "nama",
                          tanggal_lahir: null,
                          avatar: "avatar"),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: Text("Post"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
