import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/main.dart';
import 'package:tugas_1_aplikasi_x/models/AuthServices.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';
import 'package:tugas_1_aplikasi_x/pages/MyLoginPage.dart';

class MyLoginForm extends StatefulWidget {
  final Function(User user) onNext;
  final User user;

  const MyLoginForm({
    super.key,
    required this.onNext,
    required this.user,
  });

  @override
  State<MyLoginForm> createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController namaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = widget.user.email ?? '';
    namaController.text = widget.user.nama ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          child: Column(
            children: [
              Container(
                child: Text(
                  "To get started, first enter your phone, email, or @username",
                  style: TextStyle(
                    color: MyColors.primaryTextColor,
                    fontSize: 26,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Phone, email, or username"),
                  ),
                ),
              )
            ],
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
                widget.onNext(User(
                  email: emailController.text,
                  nama: namaController.text,
                  password: widget.user.password,
                  tanggal_lahir: widget.user.tanggal_lahir,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyLoginPagePassword extends StatefulWidget {
  final User user;
  // final Function(User user) onLogin;
  const MyLoginPagePassword({
    super.key,
    required this.user,
    // required this.onLogin,
  });

  @override
  State<MyLoginPagePassword> createState() => _MyLoginPagePasswordState();
}

class _MyLoginPagePasswordState extends State<MyLoginPagePassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _login(user) async {
    final data = await AuthService.login(user.email, user.password);
    if (data != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = widget.user.email;
    passwordController.text = widget.user.password;
    _login(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Enter your password",
                  style: TextStyle(
                    color: MyColors.primaryTextColor,
                    fontSize: 26,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextField(
                  controller: passwordController,
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
                widget.user.password = passwordController.text;
                widget.user.email = emailController.text;
                _login(widget.user);
              },
            ),
          ],
        ),
      ),
    );
  }
}
