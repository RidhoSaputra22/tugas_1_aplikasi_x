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
  User user = User(email: "", password: "", nama: "", tanggal_lahir: "");

  _login(user) async {
    final data = await AuthService.login(user.email, user.password);
    if (data != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyLoginPage(),
        ),
      );
    }
  }

  _regist(user) async {
    final data = await AuthService.register(
      nama: user.nama,
      email: user.email,
      password: user.password,
      tanggalLahir: user.tanggal_lahir,
    );
    if (data) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyLoginPage(),
        ),
      );
    }
  }

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
                  onRegister: (user) {
                    _regist(user);
                  },
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
                          onLogin: (user) {
                            _login(user);
                          },
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
                      onRegister: (user) {
                        _regist(user);
                      },
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
                                onLogin: (user) {
                                  _login(user);
                                },
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
