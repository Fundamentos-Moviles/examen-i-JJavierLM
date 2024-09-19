import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  List<Widget> figuras = []; // Lista de figuras.
  int numfiguras = 12; // Maximo de figuras por fila

  // Función para agregar una nueva figura a la lista.
  void agregarFigura() {
    setState(() {
      figuras.add(
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width / numfiguras, // Ajusta el ancho
          color: figuras.length % 2 == 0 ? Colors.black : Colors.grey,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: agregarFigura,
                child: Text('Iniciar Sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),

          // Contenedor para las figuras en una cuadrícula con scroll
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 0, 
                runSpacing: 0, 
                children: figuras,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




