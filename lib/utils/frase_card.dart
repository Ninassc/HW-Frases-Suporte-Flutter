import 'package:flutter/material.dart';

class FraseCard extends StatelessWidget {
  final String texto;
  const FraseCard({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 15,
            height: 1.5,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
