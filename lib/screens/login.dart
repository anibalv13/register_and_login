import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';
import 'package:register_and_login/commons/routes.dart';
import 'package:register_and_login/screens/forgot_password.dart';
import 'package:register_and_login/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  Future<void> goToRegister() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  Future<void> goToForgotPassword() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPassword()),
    );
  }

  InputDecoration buildInputDecoration(String hintText, IconData prefixIcon) {
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
      prefixIcon: Icon(prefixIcon, size: 24),
      fillColor: Colors.grey[200],
      filled: true,
    );
  }

  Widget buildDivider(double width) {
    return Padding(
      padding: width < 500
          ? const EdgeInsets.symmetric(horizontal: 25.0)
          : EdgeInsets.symmetric(horizontal: width / 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width / 3,
            height: 1.0,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Or',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: width / 3,
            height: 1.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
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
                    Image.network(
                      'https://www.solonohio.org/ImageRepository/Document?documentID=11108',
                      width: 200,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: width < 500
                          ? const EdgeInsets.symmetric(horizontal: 25.0)
                          : EdgeInsets.symmetric(horizontal: width / 8),
                      child: SignInButton(
                        borderRadius: 30,
                        button: Button.Google,
                        text: 'Sign in with Google',
                      ),
                    ),
                    const SizedBox(height: 15),
                    buildDivider(width),
                    const SizedBox(height: 15),
                    Padding(
                      padding: width < 500
                          ? const EdgeInsets.symmetric(horizontal: 25.0)
                          : EdgeInsets.symmetric(horizontal: width / 8),
                      child: TextField(
                        /* controller: _userController, */
                        decoration:
                            buildInputDecoration('Mail', Icons.people_rounded),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: width < 500
                          ? const EdgeInsets.symmetric(horizontal: 25.0)
                          : EdgeInsets.symmetric(horizontal: width / 8),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscured,
                        focusNode: textFieldFocusNode,
                        /* controller: _passwordController, */
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Password',
                          fillColor: Colors.grey[200],
                          filled: true,
                          prefixIcon: const Icon(Icons.lock_rounded, size: 24),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: _toggleObscured,
                              child: Icon(
                                _obscured
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, ROUTE_FORGOT_PASSWORD),
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, ROUTE_REGISTER),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
