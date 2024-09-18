import 'package:flutter/material.dart';
import 'package:examen1_jjlm/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  TextEditingController user = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF014B52), // Color de fondo principal
        child: Stack(
          children: [
            GridView.count(
              crossAxisCount: 5, // 5 columnas para ajustar los colores
              children: List.generate(15, (index) {
                return Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: _getColor(index), // Color basado en el índice
                    borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
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
                  color: Colors.white.withOpacity(0.8), // Color blanco con opacidad
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
                    const Text('Correo/Usuario:'),
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
                    const Text('Contraseña:'),
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
                    const SizedBox(height: 20.0),
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
                          print('Usuario: ${user.text}');
                          print("Contraseña: ${pass.text}");

                          if (user.text == "USER01" && pass.text == "PASS01") {
                            print('Ingreso correctamente');
                            showSnackBar('Ingreso correctamente', 10);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          } else {
                            print('Usuario y/o Contraseña incorrectos');
                            showSnackBar('Usuario y/o Contraseña incorrectos', 20);
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
    // Colores de fondo para los rectángulos según las filas
    List<Color> colors = [
      Color(0xFF015C64), Color(0xFF014B52), Color(0xFF014B52),
      Color(0xFF013741), Color(0xFF02B2B2),
    ];

    if (index < 5) {
      return colors[index]; // Primera fila
    } else if (index < 10) {
      return colors[4 - (index - 5)]; // Segunda fila
    } else {
      return colors[index - 10]; // Tercera fila
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
