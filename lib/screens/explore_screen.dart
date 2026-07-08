import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0), 
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F6F0),
        elevation: 0,
        title: const Text(
          'Explorar',
          style: TextStyle(fontFamily: 'Serif', color: Color(0xFF333333), fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Barra de Pesquisa
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar livros, autores ou comunidades...',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF8B5A2B)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              const Text('Categorias', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF5C4033))),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip('Fantasia'),
                    _buildCategoryChip('Ficção Científica'),
                    _buildCategoryChip('Terror'),
                    _buildCategoryChip('Romance'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text('Em Alta na Comunidade', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF5C4033))),
              const SizedBox(height: 12),
              _buildTrendingBookCard('O Problema dos Três Corpos', 'Cixin Liu', '1.2k leitores discutindo agora'),
              _buildTrendingBookCard('Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', '850 leitores discutindo agora'),
              const SizedBox(height: 24),

              const Text('Salas de Discussão Recentes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF5C4033))),
              const SizedBox(height: 12),
              _buildDiscussionRoomCard('Tópico: O final do Capítulo 15 de Duna', '42 participantes', 'Ativo há 5 min'),
              _buildDiscussionRoomCard('Tópico: Teorias sobre Shadow Slave Vol. 2', '28 participantes', 'Ativo há 12 min'),
              _buildDiscussionRoomCard('Tópico: Quem é o melhor personagem de LoM?', '67 participantes', 'Ativo há 20 min'),
              
              const SizedBox(height: 24), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ActionChip(
        label: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFD6A87C), // Bege escuro do Figma
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
        onPressed: () {},
      ),
    );
  }

  Widget _buildTrendingBookCard(String title, String author, String metric) {
    return Card(
      elevation: 0,
      color: const Color(0xFFFFFDF9), // Fundo do card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Color(0xFFE0DCD3), width: 1)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 60, height: 90,
              decoration: BoxDecoration(color: const Color(0xFF6B5B4C), borderRadius: BorderRadius.circular(8)),
              child: Center(child: Text(title.split(' ').take(2).join('\n'), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF333333))),
                  Text(author, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.local_fire_department, color: Colors.deepOrange, size: 16),
                      const SizedBox(width: 4),
                      Text(metric, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF5C4033))),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDiscussionRoomCard(String topic, String participants, String timeActive) {
    return Card(
      elevation: 0,
      color: const Color(0xFFFFFDF9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Color(0xFFE0DCD3), width: 1)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(topic, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF333333))),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.chat_bubble_outline, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(participants, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                Text(timeActive, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5A2B), // Marrom base
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(36),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Entrar na Sala'),
            )
          ],
        ),
      ),
    );
  }
}