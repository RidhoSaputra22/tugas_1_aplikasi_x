import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/main.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';

class MyRegistPage extends StatelessWidget {
  const MyRegistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
        title: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? AssetImage('images/logo-black.png')
                    : AssetImage('images/logo-white.png'),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                      color: MyColors.primaryTextColor,
                      fontSize: 26,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: MyColors.primaryColor,
            border: Border(
              top: BorderSide(
                color: MyColors.gray,
                width: 0.7,
              ),
            )),
        child: Row(
          children: [
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.gray,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {},
            ),
            Spacer(),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: MyColors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
