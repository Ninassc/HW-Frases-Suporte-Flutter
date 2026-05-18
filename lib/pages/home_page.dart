import 'dart:convert';
import 'package:appfrases/utils/frase_card.dart';
import 'package:flutter/services.dart';
import 'package:appfrases/utils/menutile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String submenuSelecionado = "Atendimento";
  String pesquisa = "";
  List<dynamic> frasesCarregadas = [];

  Future<void> carregarFrases() async {
    final String resposta = await rootBundle.loadString(
      'assets/data/frases.json',
    );
    //print(resposta);
    final List<dynamic> dados = jsonDecode(resposta);

    setState(() {
      frasesCarregadas = dados;
    });
  }

  @override
  void initState() {
    super.initState();
    carregarFrases();
  }

  @override
  Widget build(BuildContext context) {
    final frasesFiltradas = frasesCarregadas.where((frase) {
      final texto = frase["texto"].toString().toLowerCase();

      final correspondePesquisa = texto.contains(pesquisa.toLowerCase());

      final correspondeSubmenu = frase["subcategoria"] == submenuSelecionado;

      return correspondePesquisa && correspondeSubmenu;
    }).toList();

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            color: const Color(0xFF028FCF),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: const Text(
                      "HW SUPORTE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(top: 10.0),
                      children: [
                        Menutile(
                          titulo: "Suporte Remoto",
                          listaSubmenus: [
                            "Atendimento",
                            "TeamViewer",
                            "Número de Série",
                            "Instalação",
                            "Ruído no Sinal",
                            "Avaliação de Suporte",
                          ],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Hardware",
                          listaSubmenus: [
                            "Erro Amplificador",
                            "Esteira",
                            "Família 98",
                            "HeartWare Device",
                          ],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Database",
                          listaSubmenus: [
                            "Backup / Restauração",
                            "Database Danificada",
                            "Rede",
                            "NETLock",
                            "Segurança",
                          ],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Instaladores",
                          listaSubmenus: [
                            "ECGV6",
                            "ECGV11",
                            "Ergo13",
                            "ErgoMET",
                            "ErgoCP",
                          ],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Configuração",
                          listaSubmenus: [
                            "Configuração Inicial",
                            "Assinatura Digital",
                            "Configurações Mínimas",
                            "Aterramento",
                          ],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Manutenção",
                          listaSubmenus: ["Envio", "Acompanhamento", "Prazo"],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Contatos",
                          listaSubmenus: [
                            "Atendimento",
                            "Vendas",
                            "Manutenção",
                          ],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Frases Gerais",
                          listaSubmenus: ["Saudação", "Encerramento"],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 202, 217, 235),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        spacing: 30,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("../../assets/images/logo.png"),
                          Text(
                            submenuSelecionado,
                            style: TextStyle(
                              fontSize: 30,
                              color: const Color(0xFF028FCF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),

                    child: TextField(
                      onChanged: (valor) {
                        setState(() {
                          pesquisa = valor;
                        });
                      },

                      decoration: InputDecoration(
                        hintText: "Pesquisar frase...",
                        prefixIcon: const Icon(Icons.search),
                        //hoverColor: Color.fromARGB(255, 171, 197, 223),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                      child: ListView.builder(
                        itemCount: frasesFiltradas.length,
                        itemBuilder: (context, index) {
                          final frase = frasesFiltradas[index];

                          return FraseCard(texto: frase["texto"]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
