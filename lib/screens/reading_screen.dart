import 'package:flutter/material.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF8B5A2B)),
          onPressed: () {
            Navigator.pop(context);
            _showSessionModal(context);
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Capítulo 7', style: TextStyle(fontFamily: 'Serif', fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
              SizedBox(height: 24),
              Text(
                'O sol começava a descer no horizonte quando Sunny finalmente alcançou o topo da muralha. A vista era de tirar o fôlego - a Cidade Esquecida se estendia diante dele, suas estruturas antigas brilhando sob a luz dourada do entardecer.\n\nEle segurou firmemente sua espada, sentindo o peso familiar do aço em suas mãos. Os pesadelos certamente estariam à espreita nas sombras, esperando por almas desavisadas. Mas Sunny não era mais o garoto assustado que havia entrado no Feitiço do Pesadelo pela primeira vez.\n\n"Apenas mais um passo", ele murmurou para si mesmo, seus olhos vasculhando o terreno abaixo em busca de qualquer sinal de movimento. A missão era clara: alcançar o Santuário Esquecido antes do anoitecer, ou enfrentar horrores inimagináveis nas trevas.',
                style: TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF555555)),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSessionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFFFFDF9),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24, right: 24, top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text('Resumo da Sessão', style: TextStyle(fontFamily: 'Serif', fontSize: 20, fontWeight: FontWeight.bold))),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xFFE0DCD3), borderRadius: BorderRadius.circular(12)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tempo total lido', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text('25 minutos', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF5C4033))),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('Qual página você parou?', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Ex: 174', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              const Text('Deixe seu comentário (Anti-Spoiler):', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(hintText: 'Compartilhe suas impressões...', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8B5A2B), minimumSize: const Size.fromHeight(48)),
                child: const Text('Salvar & Fechar', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      }
    );
  }
}