import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyLoginPage.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyRegistPageDesktop.dart';

class MyLoginPageDesktop extends StatefulWidget {
  const MyLoginPageDesktop({super.key});

  @override
  State<MyLoginPageDesktop> createState() => _MyLoginPageDesktopState();
}

class _MyLoginPageDesktopState extends State<MyLoginPageDesktop> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  increaseIndex() {
    print(index);
    setState(() => index++);
    print(index);
  }

  _singInModal(context) {
    return AlertDialog(
      // title: const Text('Sign in'),
      content: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: SignInPage(onTap: () {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) => _passwordModal(context));
            increaseIndex();
          })),
    );
  }

  _passwordModal(context) {
    return AlertDialog(
      // title: const Text('Sign in'),
      content: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: MyLoginPagePassword()),
    );
  }

  _createAccountModal() {
    return AlertDialog(
      // title: const Text('Sign in'),
      content: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: CreateAccountPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // X Logo
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 20,
                  backgroundImage: AssetImage('images/logo-black.png'),
                ),
                // Ganti dengan logo X jika punya asset
                const SizedBox(height: 24),

                // Title
                const Text(
                  'Create an account',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // Google Login
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('images/profile.png'),
                    ),
                    title: const Text('Sign in as thisUser'),
                    subtitle: const Text('thisuser@gmail.com'),
                    trailing: const Icon(Icons.account_circle),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 16),

                // Apple Button
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.apple, color: Colors.black),
                  label: const Text('Sign up with Apple',
                      style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(height: 16),

                // OR Divider
                Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                const SizedBox(height: 16),

                // Create Account Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => _createAccountModal());
                  },
                  child: const Text('Create account'),
                ),
                const SizedBox(height: 12),

                // Terms
                Text.rich(
                  TextSpan(
                    text: 'By signing up, you agree to the ',
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: ', including '),
                      TextSpan(
                        text: 'Cookie Use.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 24),

                // Sign In
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => _singInModal(context),
                    );
                  },
                  child: const Text('Sign in'),
                ),
                const SizedBox(height: 12),

                // Get Grok
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 15,
                    backgroundImage: AssetImage('images/grok.png'),
                  ),
                  label: const Text('Get Grok',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
                const SizedBox(height: 40),

                // Footer
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  children: const [
                    FooterLink('About'),
                    FooterLink('Get the X app'),
                    FooterLink('Get the Grok app'),
                    FooterLink('Careers'),
                    FooterLink('Terms of Service'),
                    FooterLink('Privacy Policy'),
                    FooterLink('Cookie Policy'),
                    FooterLink('Developers'),
                    FooterLink('Advertising'),
                    FooterLink('Settings'),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('© 2025 X Corp.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String text;
  const FooterLink(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 11, color: Colors.blue),
    );
  }
}
