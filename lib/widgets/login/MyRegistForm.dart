import 'package:flutter/material.dart';

import 'package:tugas_1_aplikasi_x/models/AuthServices.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';
import 'package:tugas_1_aplikasi_x/pages/MyLoginPage.dart';

class MyRegistPage extends StatefulWidget {
  // final Function(User user) onRegister;
  final User user;
  const MyRegistPage({
    super.key,
    // required this.onRegister,
    required this.user,
  });

  @override
  State<MyRegistPage> createState() => _MyRegistPageState();
}

class _MyRegistPageState extends State<MyRegistPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedMonth;
  String? selectedDay;
  String? selectedYear;

  final Map<String, String> months = {
    'Januari': '01',
    'Februari': '02',
    'Maret': '03',
    'April': '04',
    'Mei': '05',
    'Juni': '06',
    'Juli': '07',
    'Agustus': '08',
    'September': '09',
    'Oktober': '10',
    'November': '11',
    'Desember': '12',
  };

  final List<String> days = List.generate(31, (index) => '${index + 1}');
  final List<String> years =
      List.generate(100, (index) => '${DateTime.now().year - index}');

  bool get isFormValid =>
      namaController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      selectedMonth != null &&
      selectedDay != null &&
      selectedYear != null;

  _regist(user) async {
    final data = await AuthService.register(
      user,
    );
    if (data) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyLoginPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _regist(widget.user);
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
                    ? NetworkImage('images/logo-black.png')
                    : NetworkImage('images/logo-white.png'),
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
                    controller: namaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
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
                ),
                SizedBox(height: 20),

                // Date of Birth Label
                const Text(
                  'Date of birth',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 12),

                // Date Dropdowns
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Month'),
                        value: selectedMonth,
                        items: months.keys
                            .toList()
                            .map((month) => DropdownMenuItem(
                                value: month, child: Text(month)))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => selectedMonth = value),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Day'),
                        value: selectedDay,
                        items: days
                            .map((day) =>
                                DropdownMenuItem(value: day, child: Text(day)))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => selectedDay = value),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Year'),
                        value: selectedYear,
                        items: years
                            .map((year) => DropdownMenuItem(
                                value: year, child: Text(year)))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => selectedYear = value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
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
              onTap: isFormValid
                  ? () {
                      widget.user.nama = namaController.text.trim();
                      widget.user.email = emailController.text.trim();
                      widget.user.password = passwordController.text.trim();
                      widget.user.tanggal_lahir = DateTime(
                          int.parse(selectedYear!),
                          int.parse(months[selectedMonth]!),
                          int.parse(selectedDay!));

                      _regist(widget.user);
                    }
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill all the fields'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: ScaffoldMessenger.of(context)
                                .hideCurrentSnackBar,
                          ),
                        ),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
