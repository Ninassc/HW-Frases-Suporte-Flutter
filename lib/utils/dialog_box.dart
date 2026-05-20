import 'package:appfrases/utils/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final dynamic controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF028FCF),
      content: SizedBox(
        height: 300,
        width: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultSelectionStyle(
              cursorColor: Colors.white,
              selectionColor: Colors.white24,

              child: TextField(
                controller: controller,
                maxLines: 4,

                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),

                  hintText: "Adicionar nova frase",
                  hintStyle: const TextStyle(color: Colors.white70),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white70,
                      width: 2,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 180,
                    height: 40,
                    child: MyButton(text: "Adicionar", onPressed: onSave),
                  ),
                ),

                SizedBox(width: 10),

                Flexible(
                  child: SizedBox(
                    width: 180,
                    height: 40,
                    child: MyButton(text: "Cancelar", onPressed: onCancel),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
