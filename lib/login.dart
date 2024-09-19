import 'package:flutter/material.dart';
import 'package:examen1_jjlm/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF014B52),
        child: Stack(
          children: [
            GridView.count(
              crossAxisCount: 5,
              children: List.generate(15, (index) {
                return Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: _getColor(index),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFD700),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: user,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Correo/Usuario',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Contraseña',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    if (errorMessage != null) ...[
                      Text(
                        errorMessage!,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFD700),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fixedSize: Size(200, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          if (user.text.isEmpty || pass.text.isEmpty) {
                            errorMessage = 'Datos incompletos';
                          } else if (user.text != "test") {
                            errorMessage = 'Usuario incorrecto';
                          } else if (pass.text != "FDM1") {
                            errorMessage = 'Contraseña incorrecta';
                          } else {
                            errorMessage = null; // Reiniciar mensaje de error
                            showSnackBar('Ingreso correctamente', 10);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                        });
                      },
                      child: const Text('Iniciar sesión'),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Mi primer examen ¿Estará sencillo?',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
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

  Color _getColor(int index) {
    List<Color> colors = [
      Color(0xFF015C64), Color(0xFF014B52), Color(0xFF014B52),
      Color(0xFF013741), Color(0xFF02B2B2),
    ];

    if (index < 5) {
      return colors[index];
    } else if (index < 10) {
      return colors[4 - (index - 5)];
    } else {
      return colors[index - 10];
    }
  }

  void showSnackBar(String texto, int duracion) {
    final snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {},
        label: 'Cerrar',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

