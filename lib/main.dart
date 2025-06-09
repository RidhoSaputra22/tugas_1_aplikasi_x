import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/layouts/DesktopLayouts.dart';
import 'package:tugas_1_aplikasi_x/layouts/MobileLayouts.dart';
import 'package:tugas_1_aplikasi_x/models/AuthServices.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';
import 'package:tugas_1_aplikasi_x/pages/MyLoginPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.light,
          fontFamily: "Chirp",
          scaffoldBackgroundColor: MyColors.primaryColor,
          primaryColor: MyColors.primaryColor,
          appBarTheme: AppBarTheme(
            backgroundColor: MyColors.primaryColor,
            titleTextStyle: TextStyle(
              color: MyColors.primaryTextColor,
            ),
          ),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: MyColors.primaryTextColor,
            ),
            bodyLarge: TextStyle(
              color: MyColors.primaryTextColor,
            ),
            bodySmall: TextStyle(
              color: MyColors.primaryTextColor,
            ),
          )),
      home: MyHomePage(isLogin: false, user: null),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool isLogin;
  final User? user;
  const MyHomePage({super.key, this.isLogin = false, required this.user});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return widget.isLogin
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 600) {
                return MobileLayouts(
                  user: widget.user!,
                );
              } else {
                return DesktopLayouts(
                  user: widget.user!,
                );
              }
            },
          )
        : MyLoginPage();
  }
}
