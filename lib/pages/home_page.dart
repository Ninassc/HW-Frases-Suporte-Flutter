import 'package:appfrases/utils/menutile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(top: 10.0),
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
                            "Ruído no Sinal",
                            "Cabeçalho / Laudo",
                            "Impressão",
                            "Conectores",
                            "Esteira",
                            "Assinatura Digital",
                            "Avaliação de Suporte",
                          ],
                        ),

                        Menutile(
                          titulo: "Hardware",
                          listaSubmenus: [
                            "USB",
                            "Amplificador",
                            "Cabo Paciente",
                            "Família 98",
                            "Drivers",
                          ],
                        ),

                        Menutile(
                          titulo: "Database",
                          listaSubmenus: [
                            "Backup",
                            "Restauração",
                            "Database Danificada",
                            "Rede",
                            "ConfigBDE",
                            "NETLock",
                            "Migração de Micro",
                            "Segurança",
                          ],
                        ),

                        Menutile(
                          titulo: "Instaladores",
                          listaSubmenus: [
                            "ECGV6",
                            "ECGV11",
                            "Ergo13",
                            "ErgoCP",
                            "ErgoMET",
                            "Demo",
                            "Atualizadores",
                          ],
                        ),

                        Menutile(
                          titulo: "Atualizadores",
                          listaSubmenus: [
                            "ECGV6",
                            "ECGV11",
                            "Ergo13",
                            "ErgoCP",
                            "ErgoMET",
                          ],
                        ),

                        Menutile(
                          titulo: "Manuais",
                          listaSubmenus: [
                            "ECGV6",
                            "Ergo13",
                            "ErgoCP",
                            "ErgoMET",
                          ],
                        ),

                        Menutile(
                          titulo: "Configuração",
                          listaSubmenus: [
                            "Windows",
                            "Regedit",
                            "Performance",
                            "Impressão",
                            "Pressão Arterial",
                            "Aterramento",
                            "Configuração Inicial",
                          ],
                        ),

                        Menutile(
                          titulo: "Rede",
                          listaSubmenus: [
                            "Compartilhamento",
                            "NETDIR",
                            "Segurança Elétrica",
                          ],
                        ),

                        Menutile(
                          titulo: "Manutenção",
                          listaSubmenus: [
                            "Envio",
                            "Formulário",
                            "Acompanhamento",
                            "Prazo",
                            "Diagnóstico",
                          ],
                        ),

                        Menutile(
                          titulo: "Comercial",
                          listaSubmenus: [
                            "Vendas",
                            "Upgrade",
                            "Troca de Equipamento",
                            "Contato",
                          ],
                        ),

                        Menutile(
                          titulo: "Frases Gerais",
                          listaSubmenus: [
                            "Saudação",
                            "Encerramento",
                            "Atendimento",
                            "Espera",
                            "Explicações Técnicas",
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(color: const Color.fromARGB(255, 201, 199, 193),
            child: Column(
              children: [
                Container(
                  height: 80,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      spacing: 30,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("../../assets/images/logo.png"),
                        Text("Frases",
                        style: TextStyle(
                          fontSize: 30,
                          color: const Color(0xFF028FCF),
                          fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                  ),
                )
              ],
            ),),
          ),
        ],
      ),
    );
  }
}
