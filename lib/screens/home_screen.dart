import 'package:flutter/material.dart';
import 'reading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F6F0),
        elevation: 0,
        title: const Text('Minhas Leituras'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF8B5A2B).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.monetization_on, color: Color(0xFF8B5A2B), size: 18),
                SizedBox(width: 4),
                Text('120', style: TextStyle(color: Color(0xFF8B5A2B), fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
      // O SafeArea envelopa o Padding para blindar as extremidades da tela do celular
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5A2B).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.menu_book, color: Color(0xFF8B5A2B)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shadow Slave', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)),
                            const Text('G3', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 8),
                            const Text('Página 142 de 304 (47%)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 4),
                            const LinearProgressIndicator(
                              value: 0.47,
                              backgroundColor: Color(0xFFE0DCD3),
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B5A2B)),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ReadingScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8B5A2B),
                                foregroundColor: Colors.white,
                                minimumSize: const Size.fromHeight(36),
                              ),
                              child: const Text('Retomar Leitura'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFD6A87C).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5A2B).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.auto_awesome, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('✨ IA Recomendação do Mês', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF5C4033))),
                          const SizedBox(height: 4),
                          Text('Lord of Mysteries', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16)),
                          const Text('Cuttlefish That Loves Diving', style: TextStyle(fontSize: 12, color: Color(0xFF5C4033))),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5C4033),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Ver Mais'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}