import 'package:flutter/material.dart';
import 'package:register_and_login/commons/routes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  final textFieldFocusNode2 = FocusNode();
  bool _obscured2 = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode2.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode2.canRequestFocus = false;
    });
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }

  Widget buildFullNameTextField(double width) {
    return Padding(
      padding: width < 500
          ? const EdgeInsets.symmetric(horizontal: 25.0)
          : EdgeInsets.symmetric(horizontal: width / 8),
      child: TextField(
        /* controller: _nameController, */
        decoration: buildInputDecoration('Full name', Icons.people_rounded),
      ),
    );
  }

  Widget buildEmailTextField(double width) {
    return Padding(
      padding: width < 500
          ? const EdgeInsets.symmetric(horizontal: 25.0)
          : EdgeInsets.symmetric(horizontal: width / 8),
      child: TextField(
        /* controller: _emailController, */
        decoration: buildInputDecoration('Email', Icons.mail),
      ),
    );
  }

  Widget buildPasswordTextField(double width, FocusNode focusNode,
      bool obscured, void Function() toggleFunction) {
    return Padding(
      padding: width < 500
          ? const EdgeInsets.symmetric(horizontal: 25.0)
          : EdgeInsets.symmetric(horizontal: width / 8),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        /* controller: _passwordAController, */
        obscureText: obscured,
        focusNode: focusNode,
        decoration: buildInputDecorationWithVisibilityToggle(
            'Password', Icons.lock_rounded, obscured, toggleFunction),
      ),
    );
  }

  Widget buildCheckBoxAndTerms(double width) {
    return Center(
      child: Padding(
        padding: width < 500
            ? const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10)
            : EdgeInsets.symmetric(horizontal: width / 8, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'I have read and accept the terms and conditions of use.',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignUpButton(double width) {
    return Padding(
      padding: width < 500
          ? const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10)
          : EdgeInsets.symmetric(horizontal: width / 8, vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: Size(MediaQuery.of(context).size.width, 70),
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Sign up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, ROUTE_LOGIN),
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String hintText, IconData prefixIcon) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(30),
      ),
      hintText: hintText,
      prefixIcon: Icon(prefixIcon, size: 24),
      fillColor: Colors.grey[200],
      filled: true,
    );
  }

  InputDecoration buildInputDecorationWithVisibilityToggle(String hintText,
      IconData prefixIcon, bool obscured, void Function() toggleFunction) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(30),
      ),
      hintText: hintText,
      prefixIcon: Icon(prefixIcon, size: 24),
      suffixIcon: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
        child: GestureDetector(
          onTap: toggleFunction,
          child: Icon(
            obscured ? Icons.visibility_rounded : Icons.visibility_off_rounded,
            size: 24,
          ),
        ),
      ),
      fillColor: Colors.grey[200],
      filled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff106ad2),
      ),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff106ad2),
                      Color(0xffa32cdf),
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
                    const Text(
                      'Registration Form',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15),
                    buildFullNameTextField(width),
                    const SizedBox(height: 10),
                    buildEmailTextField(width),
                    const SizedBox(height: 10),
                    buildPasswordTextField(
                        width, textFieldFocusNode, _obscured, _toggleObscured),
                    const SizedBox(height: 10),
                    buildPasswordTextField(width, textFieldFocusNode2,
                        _obscured2, _toggleObscured2),
                    const SizedBox(height: 10),
                    buildCheckBoxAndTerms(width),
                    buildSignUpButton(width),
                    buildLoginLink(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
