import 'package:flutter/material.dart';

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
                    Color.fromRGBO(33, 150, 243, 100),
                    Colors.blueGrey,
                    Colors.green
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Inicia Sesión',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: Colors.white),
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
                    /* controller: _userController, */
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.people_rounded, size: 24),
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
                    obscureText: _obscured,
                    focusNode: textFieldFocusNode,
                    /* controller: _passwordController, */
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Contraseña',
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
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: width < 500
                      ? const EdgeInsets.symmetric(horizontal: 25.0)
                      : EdgeInsets.symmetric(horizontal: width / 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(MediaQuery.of(context).size.width,
                          70), // Tamaño mínimo del botón
                      padding: const EdgeInsets.all(
                          10), // Espaciado interno del botón
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          '¿Ha olvidado su contraseña?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No tienes cuenta?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        ' Regístrate',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )
                  ],
                )
              ])))
        ],
      )),
    );
  }
}
