import 'package:flutter/material.dart';
import 'second_page.dart'; // استيراد الصفحة الثانية

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Stateful Clicker Counter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 150,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(fontSize: 20),
                ),
                validator: (value) {
                  if (value!.length > 1 && value.length < 10) {
                    return null;
                  } else {
                    return "invalid number";
                  }
                  // Add more phone number validation if needed
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true, // For password fields
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 20),
                ),
                validator: (value) {
                  if (value!.length < 1) {
                    return 'invalid password';
                  }
                  // Add more password validation if needed
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, navigate to the second page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(
                            phoneNumber: _phoneNumberController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Log In'),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add functionality for "Forget password" here
                print('Forget password');
              },
              child: Text('Forget password?'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for "No account? Sign Up" here
                  print('No account? Sign Up');
                },
                child: Text('No account? Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
