import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.displayName ?? 'Jonathan M.';
    final userPhotoUrl = user?.photoURL;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFF8B5A2B)),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto de Perfil Dinâmica
              CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFF8B5A2B),
                backgroundImage: userPhotoUrl != null ? NetworkImage(userPhotoUrl) : null,
                child: userPhotoUrl == null 
                    ? const Icon(Icons.person, size: 50, color: Colors.white) 
                    : null,
              ),
              const SizedBox(height: 16),
              Text(
                userName,
                style: const TextStyle(fontFamily: 'Serif', fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xFF5C4033), borderRadius: BorderRadius.circular(20)),
                child: const Text('Leitor Nível 15', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              const SizedBox(height: 32),

              // Estatísticas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('12', 'Livros Lidos'),
                  _buildStatCard('4.320', 'Páginas'),
                  _buildStatCard('🔥 14', 'Ofensiva (dias)'),
                ],
              ),
              const SizedBox(height: 32),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFD6A87C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.white, size: 32),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Saldo Atual', style: TextStyle(color: Colors.white70, fontSize: 12)),
                                Text('850 moedas', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF8B5A2B)),
                          child: const Text('Trocar'),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('15% OFF na Amazon', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF333333))),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8B5A2B), foregroundColor: Colors.white, minimumSize: const Size(80, 30)),
                            child: const Text('Resgatar', style: TextStyle(fontSize: 12)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Estante
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Minha Estante', style: TextStyle(fontFamily: 'Serif', fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBookCover('O Nome do Vento', 'Patrick Rothfuss'),
                  _buildBookCover('Jogador Nº 1', 'Ernest Cline'),
                  _buildBookCover('Neuromancer', 'William Gibson'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE0DCD3))),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBookCover(String title, String author) {
    return Column(
      children: [
        Container(
          width: 90, height: 130,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xFF6B5B4C), borderRadius: BorderRadius.circular(8)),
          child: Center(child: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
        ),
        const SizedBox(height: 8),
        SizedBox(width: 90, child: Text(author, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, color: Colors.grey))),
      ],
    );
  }
}