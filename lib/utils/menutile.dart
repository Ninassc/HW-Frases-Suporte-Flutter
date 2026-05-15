import 'package:appfrases/utils/submenu.dart';
import 'package:flutter/material.dart';

class Menutile extends StatelessWidget {
  final String titulo;
  final List<String> listaSubmenus;

  const Menutile({
    super.key,
    required this.titulo,
    required this.listaSubmenus,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(left: 20, right: 40, top: 10),
      title: Text(titulo),
      children: listaSubmenus.map((e) => Submenu(titulo: e)).toList(),
    );
  }
}
