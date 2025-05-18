import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/main.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? selectedMonth;
  String? selectedDay;
  String? selectedYear;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<String> days = List.generate(31, (index) => '${index + 1}');
  final List<String> years =
      List.generate(100, (index) => '${DateTime.now().year - index}');

  bool get isFormValid =>
      nameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      selectedMonth != null &&
      selectedDay != null &&
      selectedYear != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // X Logo
              Center(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 20,
                    backgroundImage: const AssetImage(
                      'images/logo-black.png',
                    )),
              ),
              const SizedBox(height: 24),

              // Title
              const Text(
                'Create your account',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Name Field
              TextField(
                controller: nameController,
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),

              // Email Field
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 24),

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
                      items: months
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
                      onChanged: (value) => setState(() => selectedDay = value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Year'),
                      value: selectedYear,
                      items: years
                          .map((year) =>
                              DropdownMenuItem(value: year, child: Text(year)))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedYear = value),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Next Button
              ElevatedButton(
                onPressed: isFormValid
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: isFormValid ? Colors.black : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child:
                    const Text('Next', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
