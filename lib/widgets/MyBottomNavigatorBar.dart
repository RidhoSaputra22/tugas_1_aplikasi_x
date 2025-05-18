import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';

class MyBottomNavigatorBar extends StatelessWidget {
  const MyBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: MyColors.primaryTextColor),
          Icon(Icons.search, color: MyColors.primaryTextColor),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('images/grok.png'),
          ),
          Icon(Icons.group_outlined, color: MyColors.primaryTextColor),
          Icon(Icons.notifications_active_outlined,
              color: MyColors.primaryTextColor),
          Icon(Icons.mail_outline, color: MyColors.primaryTextColor),
        ],
      ),
    );
  }
}
