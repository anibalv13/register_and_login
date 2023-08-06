import 'package:flutter/material.dart';
import 'package:register_and_login/screens/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  InputDecoration buildInputDecoration(String hintText, IconData suffixIcon) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(30),
      ),
      hintText: hintText,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Icon(suffixIcon, size: 24),
      ),
      fillColor: Colors.grey[200],
      filled: true,
    );
  }

  Future<void> goToLogin() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xffa32cdf),
      ),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffa32cdf),
                      Color(0xff106ad2),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: width < 500
                            ? const EdgeInsets.symmetric(horizontal: 25.0)
                            : EdgeInsets.symmetric(horizontal: width / 8),
                        child: TextField(
                          /* controller: _userController, */
                          decoration: buildInputDecoration(
                              'Insert your mail', Icons.mail),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: width < 500
                            ? const EdgeInsets.symmetric(horizontal: 25.0)
                            : EdgeInsets.symmetric(horizontal: width / 8),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: Size(
                              MediaQuery.of(context).size.width,
                              65,
                            ),
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Recovery password',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: goToLogin,
                        child: const Text(
                          'Back to home',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
