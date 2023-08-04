import 'package:flutter/material.dart';
import 'package:register_and_login/screens/login.dart';

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
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode2.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode2.canRequestFocus =
          false; // Prevents focus if tap on eye
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

  Future goToLogin() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Stack(children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.blueGrey,
                    Color.fromRGBO(33, 150, 243, 100),
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
                    'Registrate',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Formulario de registro',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Nombre completo
                  Padding(
                    padding: width < 500
                        ? const EdgeInsets.symmetric(horizontal: 25.0)
                        : EdgeInsets.symmetric(horizontal: width / 8),
                    child: TextField(
                      /* controller: _nameController, */
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Nombre',
                          prefixIcon:
                              const Icon(Icons.people_rounded, size: 24),
                          fillColor: Colors.grey[200],
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: width < 500
                        ? const EdgeInsets.symmetric(horizontal: 25.0)
                        : EdgeInsets.symmetric(horizontal: width / 8),
                    child: TextField(
                      /* controller: _nameController, */
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Apellido',
                          prefixIcon:
                              const Icon(Icons.people_rounded, size: 24),
                          fillColor: Colors.grey[200],
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Email
                  Padding(
                    padding: width < 500
                        ? const EdgeInsets.symmetric(horizontal: 25.0)
                        : EdgeInsets.symmetric(horizontal: width / 8),
                    child: TextField(
                      /*  controller: _emailController, */
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.mail, size: 24),
                          fillColor: Colors.grey[200],
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Contraseña
                  Padding(
                    padding: width < 500
                        ? const EdgeInsets.symmetric(horizontal: 25.0)
                        : EdgeInsets.symmetric(horizontal: width / 8),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      /* controller: _passwordAController, */
                      obscureText: _obscured,
                      focusNode: textFieldFocusNode,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Contraseña',
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
                          fillColor: Colors.grey[200],
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Repetir Contraseña
                  Padding(
                    padding: width < 500
                        ? const EdgeInsets.symmetric(horizontal: 25.0)
                        : EdgeInsets.symmetric(horizontal: width / 8),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscured2,
                      focusNode: textFieldFocusNode2,
                      /*  controller: _passwordBController, */
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Repetir contraseña',
                          prefixIcon: const Icon(Icons.lock_rounded, size: 24),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: _toggleObscured2,
                              child: Icon(
                                _obscured2
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                              ),
                            ),
                          ),
                          fillColor: Colors.grey[200],
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: width < 500
                          ? const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10)
                          : EdgeInsets.symmetric(
                              horizontal: width / 8, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
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
                                'He leído y acepto los términos y condiciones de uso',
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
                  ),
                  Padding(
                    padding: width < 500
                        ? const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10)
                        : EdgeInsets.symmetric(
                            horizontal: width / 8, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(MediaQuery.of(context).size.width,
                            70), // Tamaño mínimo del botón
                        padding: const EdgeInsets.all(
                            10), // Espaciado interno del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Regístrate',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ya tienes cuenta?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: goToLogin,
                        child: const Text(
                          ' Inicia Sesión',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
