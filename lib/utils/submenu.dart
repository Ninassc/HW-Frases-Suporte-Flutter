import 'package:flutter/material.dart';

class Submenu extends StatelessWidget {
  final String titulo;
  final Function(String) onSubmenuClick;

  const Submenu({
    super.key,
    required this.titulo,
    required this.onSubmenuClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        title: Text(
          titulo,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        mouseCursor: SystemMouseCursors.click,
        onTap: () {
          onSubmenuClick(titulo);
        },
      ),
    );
  }
}
