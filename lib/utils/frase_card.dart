import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              texto,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: texto));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Texto copiado!"),

                      backgroundColor: const Color.fromARGB(255, 125, 125, 126),

                      duration: const Duration(milliseconds: 800),

                      behavior: SnackBarBehavior.fixed,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },

                icon: const Icon(Icons.copy, color: Color(0xFF028FCF)),
                label: const Text(
                  "Copiar",
                  style: TextStyle(color: Color(0xFF028FCF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
