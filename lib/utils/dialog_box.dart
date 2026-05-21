import 'package:appfrases/utils/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController categoriaController;
  final TextEditingController subcategoriaController;
  final TextEditingController fraseController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.categoriaController,
    required this.subcategoriaController,
    required this.fraseController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF028FCF),
      content: SizedBox(
        height: 500,
        width: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultSelectionStyle(
              cursorColor: Colors.white,
              selectionColor: Colors.white24,

              child: TextField(
                controller: categoriaController,
                maxLines: 1,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),

                  hintText: "Categoria",
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

            DefaultSelectionStyle(
              cursorColor: Colors.white,
              selectionColor: Colors.white24,

              child: TextField(
                controller: subcategoriaController,
                maxLines: 1,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),

                  hintText: "Subcategoria",
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

            DefaultSelectionStyle(
              cursorColor: Colors.white,
              selectionColor: Colors.white24,

              child: TextField(
                controller: fraseController,
                maxLines: 6,
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
