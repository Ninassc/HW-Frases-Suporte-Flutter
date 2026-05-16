import 'package:appfrases/utils/submenu.dart';
import 'package:flutter/material.dart';

class Menutile extends StatelessWidget {
  final String titulo;
  final List<String> listaSubmenus;
  final Function(String) onSubmenuClick;

  const Menutile({
    super.key,
    required this.titulo,
    required this.listaSubmenus,
    required this.onSubmenuClick
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(left: 20, right: 40, top: 10),
      title: Text(titulo),
      children: listaSubmenus.map((e) {
        return Submenu(
          titulo: e,
          onSubmenuClick: onSubmenuClick,
        );
      }).toList(),
    );
  }
}
