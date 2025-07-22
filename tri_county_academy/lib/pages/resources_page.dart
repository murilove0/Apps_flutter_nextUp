import 'package:flutter/material.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // cor de fundo inferior

      body: Column(
        children: [
          // 🔵 Header azul claro com botão de voltar
          Container(
            color: const Color(0xFF0D2C54), // azul claro
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                
                const Text(
                  'Resources',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 🖼️ Imagem central
          Container(
            color: const Color(0xFF0D2C54),
            width: double.infinity,
            
            child: Image.asset(
              'assets/Header.jpg', 
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          // 📱 Botões de recurso
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _resourceButton(
                  icon: Icons.phone,
                  label: 'Calling the 988 Lifeline',
                  onTap: () {
                    Navigator.pushNamed(context, '/calling_988_lifeline');
                  },
                ),
                _resourceButton(
                  icon: Icons.sms,
                  label: 'Texting the 988 Lifeline',
                  onTap: () {
                    Navigator.pushNamed(context, '/texting_988_lifeline');
                  },
                ),
                _resourceButton(
                  icon: Icons.chat,
                  label: '988 Lifeline Chat',
                  onTap: () {
                    Navigator.pushNamed(context, '/lifeline_chat');
                  },
                ),
                _resourceButton(
                  icon: Icons.info,
                  label: 'About Us',
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                ),
                _resourceButton(
                  icon: Icons.campaign,
                  label: 'Promoting the Lifeline',
                  onTap: () {
                    Navigator.pushNamed(context, '/promoting_lifeline');
                  },
                ),
                _resourceButton(
                  icon: Icons.show_chart,
                  label: 'Research and Evaluation',
                  onTap: () {
                    Navigator.pushNamed(context, '/research_evaluation');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔘 Botão de recurso reutilizável
  Widget _resourceButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF183C66), // azul claro do botão
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.white),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          elevation: 0,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
