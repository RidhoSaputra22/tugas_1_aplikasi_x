import "package:flutter/material.dart";
import "package:tugas_1_aplikasi_x/models/MyColors.dart";

class MyFloatigActionButton extends StatelessWidget {
  final Function()? onPressed;

  MyFloatigActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.secondaryColor,
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        color: MyColors.white,
      ),
      onPressed: onPressed as void Function()?,
    );
  }
}
