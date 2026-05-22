import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:super_clipboard/super_clipboard.dart';

import 'package:appfrases/utils/dialog_box.dart';
import 'package:appfrases/utils/frase_card.dart';
import 'package:appfrases/utils/menutile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //print("Init");
    super.initState();
    carregarFrases();
    carregarImagens();
  }

  @override
  void dispose() {
    fraseController.dispose();
    categoriaController.dispose();
    subcategoriaController.dispose();

    super.dispose();
  }

  String submenuSelecionado = "Atendimento Suporte";
  String pesquisa = "";
  List<dynamic> frasesCarregadas = [];
  String tipoConteudo = "frases";
  List<dynamic> imagensCarregadas = [];

  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController subcategoriaController = TextEditingController();
  final TextEditingController fraseController = TextEditingController();

  Future<File> pegarArquivoJson() async {
    return File(
      r'\\hwfs01\Area Publica\Suporte (Disco T)\Suporte\FrasesJsonApp\frases.json',
    );
  }

  Future<void> carregarFrases() async {
    try {
      final arquivo = await pegarArquivoJson();

      if (!await arquivo.exists()) {
        final jsonInicial = await rootBundle.loadString(
          'assets/data/frases.json',
        );
        await arquivo.writeAsString(jsonInicial);
      }

      final conteudo = await arquivo.readAsString();

      final List<dynamic> dados = jsonDecode(conteudo);

      setState(() {
        frasesCarregadas = dados;
      });
    } catch (e) {
      //print("Erro ao carregar frases: $e");
    }
  }

  Future<void> carregarImagens() async {
    //print("carregando imagens");
    final String resposta = await rootBundle.loadString(
      'assets/data/imagens.json',
    );

    final List<dynamic> dados = jsonDecode(resposta);

    setState(() {
      imagensCarregadas = dados;
      //print(imagensCarregadas);
    });
  }

  Future<void> copiarImagem(String assetPath) async {
    final clipboard = SystemClipboard.instance;

    if (clipboard == null) return;

    final bytes = await rootBundle.load(assetPath);

    final item = DataWriterItem();

    item.add(Formats.png(bytes.buffer.asUint8List()));

    await clipboard.write([item]);
  }

  @override
  Widget build(BuildContext context) {
    final frasesFiltradas = frasesCarregadas.where((frase) {
      final texto = frase["texto"].toString().toLowerCase();
      final correspondePesquisa = texto.contains(pesquisa.toLowerCase());
      final correspondeSubmenu = frase["subcategoria"] == submenuSelecionado;

      if (submenuSelecionado == "Todas") {
        return correspondePesquisa;
      }

      return correspondePesquisa && correspondeSubmenu;
    }).toList();

    final imagensFiltradas = imagensCarregadas.where((imagem) {
      final correspondeImagem = imagem["subcategoria"] == submenuSelecionado;

      if (submenuSelecionado == "Todas as Imagens") {
        return true;
      }
      return correspondeImagem;
    }).toList();

    //print(imagensFiltradas.length);
    //print(submenuSelecionado);

    Future<void> adicionarFrase() async {
      if (categoriaController.text != "" &&
          subcategoriaController.text != "" &&
          fraseController.text != "") {
        final novaFrase = {
          "categoria": categoriaController.text,

          "subcategoria": subcategoriaController.text,

          "texto": fraseController.text,
        };

        frasesCarregadas.add(novaFrase);

        final arquivo = await pegarArquivoJson();
        //print(arquivo.path);

        await arquivo.writeAsString(jsonEncode(frasesCarregadas));

        setState(() {});

        categoriaController.clear();
        subcategoriaController.clear();
        fraseController.clear();

        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                categoriaController: categoriaController,
                subcategoriaController: subcategoriaController,
                fraseController: fraseController,

                onSave: () => adicionarFrase(),

                onCancel: () {
                  categoriaController.clear();
                  subcategoriaController.clear();
                  fraseController.clear();
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },

        backgroundColor: const Color(0xFF028FCF),
        child: Icon(Icons.add, color: Colors.white),
      ),

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
                            "Atendimento Suporte",
                            "TeamViewer",
                            "Número de Série",
                            "Instalação",
                            "Ruído no Sinal",
                            "Avaliação de Suporte",
                          ],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                              tipoConteudo = "frases";
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
                              tipoConteudo = "frases";
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
                              tipoConteudo = "frases";
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
                              tipoConteudo = "frases";
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
                              tipoConteudo = "frases";
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Manutenção",
                          listaSubmenus: ["Envio", "Acompanhamento", "Prazo"],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                              tipoConteudo = "frases";
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
                              tipoConteudo = "frases";
                            });
                          },
                        ),

                        Menutile(
                          titulo: "Frases Gerais",
                          listaSubmenus: ["Saudação", "Encerramento"],
                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                              tipoConteudo = "frases";
                            });
                          },
                        ),
                        Menutile(
                          titulo: "Imagens",
                          listaSubmenus: [
                            "Amplificador / Conectores",
                            "Cabo Paciente / Rabichos",
                            "Monitorização",
                            "Assinatura",
                            "Registro PA",
                            "Database",
                            "Rede",
                            "Energia",
                            "Windows Update",
                            "Gerando PFX",
                            "Todas as Imagens",
                          ],

                          onSubmenuClick: (titulo) {
                            setState(() {
                              submenuSelecionado = titulo;
                              tipoConteudo = "imagens";
                            });
                          },
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            right: 40,
                            top: 10,
                          ),
                          title: Text("Todas as frases"),
                          mouseCursor: SystemMouseCursors.click,
                          onTap: () => {
                            setState(() {
                              submenuSelecionado = "Todas";
                              tipoConteudo = "frases";
                            }),
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
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/logo.png"),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              submenuSelecionado,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 30,
                                color: const Color(0xFF028FCF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: tipoConteudo == "frases"
                        ? Column(
                            children: [
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
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 80,
                                    top: 10,
                                    bottom: 10,
                                  ),

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
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 80,
                              top: 10,
                              bottom: 10,
                            ),

                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,

                                    crossAxisSpacing: 10,

                                    mainAxisSpacing: 20,

                                    childAspectRatio: 1,
                                  ),

                              itemCount: imagensFiltradas.length,

                              itemBuilder: (context, index) {
                                final imagem = imagensFiltradas[index];

                               //print(imagem["imagem"]);

                                return InkWell(
                                  mouseCursor: SystemMouseCursors.click,
                                  onTap: () async {
                                    await copiarImagem(imagem["imagem"]);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text("Imagem copiada!"),

                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          125,
                                          125,
                                          126,
                                        ),

                                        duration: const Duration(
                                          milliseconds: 800,
                                        ),

                                        behavior: SnackBarBehavior.fixed,

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                                  child: Card(
                                    clipBehavior: Clip.antiAlias,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),

                                    child: Image.asset(
                                      imagem["imagem"],

                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                );
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
