import 'package:flutter/material.dart';

// O texto completo foi restaurado com base na sua solicitação anterior.
const allText = {
  'about':
      'At Tri County Academy, we’re dedicated to saving lives through education, support, and compassionate outreach. Our mobile app is purpose-built for suicide prevention, offering reliable guidance and essential tools whenever – and wherever – they’re needed.',
  'whoWeAre':
      'Tri County Academy is a coalition of mental-health professionals, educators, community leaders, and trained volunteers—all united by a shared goal: to prevent suicide and promote mental well-being across our region. We believe every life matters and that early intervention, awareness, and community support are key to nurturing hope.',
  'missionItems': [
    'Prevention & Intervention – Deliver immediate, accessible guidance to individuals in distress and provide trusted pathways to professional care.',
    'Education & Awareness – Equip families, friends, schools, and workplaces with practical knowledge and tools to recognize warning signs and offer help.',
    'Community Empowerment – Reduce stigma around mental health through open, informed conversation and community-driven outreach.',
  ],
  'offerItems': [
    'Guided Modules – Self‑paced lessons on recognizing risk factors, coping strategies, and safety planning.',
    'Resource Library – Curated access to local and national helplines, mental health services, and crisis intervention tools.',
  ],
  'approachItems': [
    'Evidence-Based – We build our content on well-researched, proven strategies in suicide prevention.',
    'Inclusive & Non-Judgmental – Support for everyone, regardless of background or experience.',
    'Confidential & Safe – Privacy is paramount—your information remains secure and respected.',
    'Always Available – Our app is here 24/7, ensuring help is just a tap away.',
  ],
  'conclusion':
      'With the Tri County Academy app, you’re joining a caring, informed community dedicated to giving everyone the knowledge—and the courage—to reach out, connect, and find hope. Together, we can create stronger, more aware communities—and save lives.',
};

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Estilo padrão para os parágrafos de texto, para evitar repetição.
    const textStyle = TextStyle(
      fontSize: 15,
      height: 1.5,
      color: Color(0xFF0D2C54),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF0D2C54),
        foregroundColor: Colors.white, // Garante que o título e o ícone sejam brancos
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400), // Limita a largura máxima
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle('About Us'),
                Text.rich(
                  TextSpan(
                    style: textStyle,
                    children: const <TextSpan>[
                      TextSpan(text: 'At '),
                      TextSpan(
                          text: 'Tri County Academy',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ', we’re dedicated to saving lives through education, support, and compassionate outreach. Our mobile app is purpose-built for suicide prevention, offering reliable guidance and essential tools whenever – and wherever – they’re needed.'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const SectionTitle('Who We Are'),
                Text.rich(
                  TextSpan(
                    style: textStyle,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Tri County Academy',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' is a coalition of mental-health professionals, educators, community leaders, and trained volunteers—all united by a shared goal: to prevent suicide and promote mental well-being across our region. We believe every life matters and that early intervention, awareness, and community support are key to nurturing hope.'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const SectionTitle('Our Mission'),
                BulletList(
                  items: [
                    Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Prevention & Intervention', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – Deliver immediate, accessible guidance to individuals in distress and provide trusted pathways to professional care.'),
                    ])),
                    Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Education & Awareness', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – Equip families, friends, schools, and workplaces with practical knowledge and tools to recognize warning signs and offer help.'),
                    ])),
                     Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Community Empowerment', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – Reduce stigma around mental health through open, informed conversation and community-driven outreach.'),
                    ])),
                  ],
                ),
                const SizedBox(height: 24),

                const SectionTitle('What We Offer'),
                BulletList(
                  items: [
                    Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Guided Modules', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – Self‑paced lessons on recognizing risk factors, coping strategies, and safety planning.'),
                    ])),
                    Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Resource Library', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – Curated access to local and national helplines, mental health services, and crisis intervention tools.'),
                    ])),
                  ],
                ),
                const SizedBox(height: 24),

                const SectionTitle('Our Approach'),
                BulletList(
                  items: [
                     Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Evidence-Based', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – We build our content on well-researched, proven strategies in suicide prevention.'),
                    ])),
                     Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Inclusive & Non-Judgmental', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – Support for everyone, regardless of background or experience.'),
                    ])),
                     Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Confidential & Safe', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – Privacy is paramount—your information remains secure and respected.'),
                    ])),
                     Text.rich(TextSpan(style: textStyle, children: const [
                      TextSpan(text: 'Always Available', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' – Our app is here 24/7, ensuring help is just a tap away.'),
                    ])),
                  ],
                ),
                const SizedBox(height: 24),

                Text.rich(
                  TextSpan(
                    style: textStyle,
                    children: const <TextSpan>[
                      TextSpan(text: 'With the '),
                      TextSpan(
                          text: 'Tri County Academy',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' app, you’re joining a caring, informed community dedicated to giving everyone the knowledge—and the courage—to reach out, connect, and find hope. Together, we can create stronger, more aware communities—and save lives.'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Adiciona um espaço abaixo do título
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0D2C54),
        ),
      ),
    );
  }
}

// O widget SectionText não é mais necessário e pode ser removido.

/// Widget `BulletList` MODIFICADO para aceitar uma lista de Widgets.
class BulletList extends StatelessWidget {
  // Alterado de List<String> para List<Widget>
  final List<Widget> items;

  const BulletList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => 
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0), // Espaçamento entre os itens
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "• ",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Color(0xFF0D2C54),
                  fontWeight: FontWeight.bold, // Deixa o marcador de bolinha em negrito
                ),
              ),
              // O item agora é renderizado diretamente, pois já é um widget (Text.rich)
              Expanded(child: item),
            ],
          ),
        )
      ).toList(),
    );
  }
}