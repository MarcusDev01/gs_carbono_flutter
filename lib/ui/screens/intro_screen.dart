import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_IntroSlide> _slides = [
    _IntroSlide(
      icon: Icons.public,
      title: 'Bem-vindo',
      description:
          'Monitore suas emissões de carbono de forma simples e eficiente.',
    ),
    _IntroSlide(
      icon: Icons.satellite_alt,
      title: 'Estatísticas',
      description:
          'Acompanhe seus dados com gráficos e relatórios detalhados.',
    ),
    _IntroSlide(
      icon: Icons.tune,
      title: 'Personalize',
      description:
          'Ajuste as configurações de acordo com suas preferências.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == _slides.length - 1) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _slides.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final slide = _slides[index];

                return Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        slide.icon,
                        size: 90,
                        color: const Color(0xFF06B6D4),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        slide.title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF06B6D4),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        slide.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _slides.length,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color(0xFF06B6D4)
                      : const Color(0xFF6D28D9),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed:
                      _currentPage == 0 ? null : _previousPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Voltar'),
                ),

                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    _currentPage == _slides.length - 1
                        ? 'Começar'
                        : 'Próximo',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroSlide {
  final IconData icon;
  final String title;
  final String description;

  const _IntroSlide({
    required this.icon,
    required this.title,
    required this.description,
  });
}