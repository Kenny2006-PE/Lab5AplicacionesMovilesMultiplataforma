import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D267D), // Fondo azul oscuro
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: const Text(
                  '0',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  buildButtonRow(['C', '+/-', '%', '÷']),
                  buildButtonRow(['7', '8', '9', '×']),
                  buildButtonRow(['4', '5', '6', '-']),
                  buildButtonRow(['1', '2', '3', '+']),
                  buildButtonRow(['0', '.', '='], isLastRow: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> texts, {bool isLastRow = false}) {
    return Expanded(
      child: Row(
        children: texts.map((text) {
          bool isOperator = ['÷', '×', '-', '+', '='].contains(text);
          bool isFunction = ['C', '+/-', '%'].contains(text);

          Color buttonColor;
          if (isOperator) {
            buttonColor = const Color(0xFFA50044); // Grana (rojo vino)
          } else if (isFunction) {
            buttonColor = const Color(0xFFFFD700); // Amarillo
          } else {
            buttonColor = const Color(0xFF3B4CCA); // Azul clarito
          }

          return Expanded(
            flex: (isLastRow && text == '0') ? 2 : 1, // El botón '0' ocupa el doble de espacio
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: isFunction ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
