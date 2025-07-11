import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/main.dart';
import 'package:tugas_1_aplikasi_x/models/AuthServices.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';
import 'package:tugas_1_aplikasi_x/widgets/login/MyLoginForm.dart';
import 'package:tugas_1_aplikasi_x/widgets/login/MyLoginWidget.dart';
import 'package:tugas_1_aplikasi_x/widgets/login/MyRegistForm.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  // final Future<List<User>> users = User.fetchUsers();
  User user = User(
      id: null,
      avatar: null,
      email: null,
      password: null,
      nama: null,
      tanggal_lahir: null);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return MyLoginWidget(
          user: user,
          onNextRegist: (user) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyRegistPage(
                  user: user,
                ),
              ),
            );
          },
          onNextLogin: (user) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyLoginForm(
                  user: user,
                  onNext: (user) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyLoginPagePassword(
                          user: user,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      } else {
        // print(MediaQuery.of(context).size.width / 4);
        return Container(
          // width: 300,
          margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 3),
          child: MyLoginWidget(
            user: user,
            onNextRegist: (user) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: MyRegistPage(
                      user: user,
                    ),
                  ),
                ),
              );
            },
            onNextLogin: (user) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: MyLoginForm(
                      user: user,
                      onNext: (user) {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: MyLoginPagePassword(
                                user: user,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
