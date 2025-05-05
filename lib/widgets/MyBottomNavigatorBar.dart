import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';

class MyBottomNavigatorBar extends StatelessWidget {
  const MyBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      type: BottomNavigationBarType.shifting,
      backgroundColor: MyColors.primaryColor,
      fixedColor: MyColors.primaryColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: MyColors.primaryTextColor,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: MyColors.primaryTextColor,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.golf_course_outlined,
            color: MyColors.primaryTextColor,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: MyColors.primaryTextColor,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_outlined,
            color: MyColors.primaryTextColor,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.mail_outline,
            color: MyColors.primaryTextColor,
          ),
          label: "",
        ),
      ],
    );
  }
}
