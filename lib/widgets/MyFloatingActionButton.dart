import "package:flutter/material.dart";
import "package:tugas_1_aplikasi_x/models/MyColors.dart";

class MyFloatigActionButton extends StatelessWidget {
  const MyFloatigActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.secondaryColor,
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        color: MyColors.white,
      ),
      onPressed: () {},
    );
  }
}
