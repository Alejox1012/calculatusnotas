import 'package:flutter/material.dart';
/* Proyecto Práctico Parte 2. Ejercisio1. Calcular 4 notas de un estudiante
  Desarrollo de aplicaciones Híbridas
   hecho por:
    -  Didian alejandro valencia ruiz
    -  Harold Rafael Martinez Martinez  */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de Promedio'),
        ),
        body: const Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController note1Controller = TextEditingController();
  final TextEditingController note2Controller = TextEditingController();
  final TextEditingController note3Controller = TextEditingController();
  final TextEditingController note4Controller = TextEditingController();
  double average = 0;

  void calculateAverage() {
    double n1 = double.tryParse(note1Controller.text) ?? 0;
    double n2 = double.tryParse(note2Controller.text) ?? 0;
    double n3 = double.tryParse(note3Controller.text) ?? 0;
    double n4 = double.tryParse(note4Controller.text) ?? 0;
    double total = n1 + n2 + n3 + n4;
    average = total / 4;
    setState(() {});
  }

  String determineResult() {
    if (average >= 3.0) {
      return 'Felicidades, ganaste la materia';
    } else if (average > 0) {
      return 'Perdiste la materia';
    } else {
      return ''; // Mostrar mensaje vacío si no hay notas
    }
  }

  void clearFields() {
    note1Controller.clear();
    note2Controller.clear();
    note3Controller.clear();
    note4Controller.clear();
    average = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Fondo gris
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
      ),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Calcula tu promedio',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            controller: note1Controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Nota 1 (0.0 - 5.0)'),
          ),
          TextField(
            controller: note2Controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Nota 2 (0.0 - 5.0)'),
          ),
          TextField(
            controller: note3Controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Nota 3 (0.0 - 5.0)'),
          ),
          TextField(
            controller: note4Controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Nota 4 (0.0 - 5.0)'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              calculateAverage();
            },
            child: const Text('Calcular Promedio'),
          ),
          const SizedBox(height: 20),
          Text(
            'Promedio: ${average.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            determineResult(),
            style: TextStyle(
              fontSize: 20,
              color: average >= 3.0 ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              clearFields();
            },
            child: const Text('Borrar Campos'),
          ),
        ],
      ),
    );
  }
}
