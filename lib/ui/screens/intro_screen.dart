import 'package:flutter/material.dart';
import '../../navigation/app_routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  int page = 0;

  final List<Map<String, String>> pages = [
    {
      "title": "Bem-vindo",
      "description":
          "Monitore emissões de carbono utilizando dados inspirados em satélites."
    },
    {
      "title": "Dados Ambientais",
      "description":
          "Visualize informações de diferentes regiões e fontes poluentes."
    },
    {
      "title": "Sustentabilidade",
      "description":
          "Ajude no combate às mudanças climáticas através da informação."
    }
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Introdução"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Icon(
              Icons.satellite_alt,
              size: 120,
              color: Colors.green,
            ),

            const SizedBox(height: 30),

            Text(
              pages[page]["title"]!,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              pages[page]["description"]!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ElevatedButton(
                  onPressed: page > 0
                      ? () {
                          setState(() {
                            page--;
                          });
                        }
                      : null,
                  child: const Text("Voltar"),
                ),

                ElevatedButton(
                  onPressed: () {

                    if (page < 2) {
                      setState(() {
                        page++;
                      });
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.dashboard,
                      );
                    }
                  },
                  child: Text(
                    page == 2 ? "Entrar" : "Próximo",
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