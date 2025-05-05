import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/layouts/DesktopLayouts.dart';
import 'package:tugas_1_aplikasi_x/layouts/MobileLayouts.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyBottomNavigatorBar.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyFloatingActionButton.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyPost.dart';

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
          brightness: Brightness.light,
          fontFamily: "Chirp",
          scaffoldBackgroundColor: MyColors.primaryColor,
          primaryColor: MyColors.primaryColor,
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return MobileLayouts();
      } else {
        return DesktopLayouts();
      }
    });
  }
}
