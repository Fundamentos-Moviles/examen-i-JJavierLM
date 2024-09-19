import 'package:flutter/material.dart';
import 'package:examen1_jjlm/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF014B52), // Color de fondo
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Hacer el AppBar transparente
        title: Center( // Centrar el título
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Fondo blanco para el rectángulo
              borderRadius: BorderRadius.circular(20), // Bordes redondeados
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text(
              "Notificaciones de actividades",
              style: TextStyle(color: Colors.black), // Texto negro
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: con.listaExamen.length,
                itemBuilder: (context, index) {
                  var datos = con.listaExamen[index].split('#');
                  bool showButtons = (index + 1) % 2 == 0; // Mostrar botones

                  return createCard(
                    numero: datos[1],
                    titulo: datos[2],
                    descripcion: datos[3],
                    id: datos[0],
                    showButtons: showButtons,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "SEGUNDA VISTA: Lopez Morales Juan Javier",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createCard({required String numero, required String titulo, required String descripcion, required String id, required bool showButtons}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$numero", style: const TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 5),
            Text(descripcion),
            if (showButtons) ...[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF014B52), // Color del rectángulo
                      borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    ),
                    child: TextButton.icon(
                      onPressed: () {
                        print("Ver más ID: $id");
                      },
                      icon: const Icon(Icons.arrow_forward, size: 16, color: Colors.white),
                      label: const Text("Ver más", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF014B52), // Color del rectángulo
                      borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    ),
                    child: TextButton.icon(
                      onPressed: () {
                        print("Borrar ID: $id");
                      },
                      icon: const Icon(Icons.delete, size: 16, color: Colors.white),
                      label: const Text("Borrar", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
