import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';
import 'package:tugas_1_aplikasi_x/widgets/login/MyLoginForm.dart';

class MyLoginWidget extends StatefulWidget {
  final Function(User user) onNextLogin;
  final Function(User user) onNextRegist;
  User user;

  MyLoginWidget({
    super.key,
    required this.onNextLogin,
    required this.onNextRegist,
    required this.user,
  });

  @override
  State<MyLoginWidget> createState() => _MyLoginWidgetState();
}

class _MyLoginWidgetState extends State<MyLoginWidget> {
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.user.email ?? '';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo X
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/logo-black.png'),
              ),
              SizedBox(height: 24),

              // Title
              Text(
                'Sign in to X',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              // Google Account (mock)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/profile.png'),
                  ),
                  title: Text(
                    'Sign in as ThisUser',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  subtitle: Text('thisuser22022@gmail.com'),
                  trailing: Icon(Icons.account_circle),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 16),

              // Apple Sign-in Button
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                icon: Icon(Icons.apple),
                label: Text('Sign in with Apple'),
              ),
              SizedBox(height: 16),

              // OR Divider
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),

              // Input Field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Phone, email, or username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
              SizedBox(height: 16),

              // Next Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  widget.user.email = emailController.text;
                  widget.onNextLogin(widget.user);
                },
                child: Text('Next', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 12),

              // Forgot password
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: Text('Forgot password?'),
              ),
              SizedBox(height: 24),

              // Sign up prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  InkWell(
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      widget.onNextRegist(widget.user);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
