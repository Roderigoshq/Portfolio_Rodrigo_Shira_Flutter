import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1300) {
        return _buildSmallScreen();
      } else {
        return _buildLargeScreen();
      }
    });
  }

  Widget _buildSmallScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'about me',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'lib/assets/4210456 2.png',
                  width: 28,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(24, 14, 27, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color.fromRGBO(63, 63, 63, 1),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'lib/assets/fotoLinkedin2.png',
                      width: 238,
                      height: 238,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Olá, meu nome é Rodrigo Shiraishi Quadros, um apaixonado em criar'
                    'websites bonitos. Desde 2018, sou fascinado por qualquer coisa relacionada à'
                    'interfaces ou designs bem desenhados, e sempre desenvolvi minhas'
                    'habilidades desde então, fazendo logos, banners, designs gráficos em geral.\n\n'
                    'Em 2023, decidi entrar para o mundo de programação, estudando no'
                    'Instituto Mauá de Tecnologia, porém comecei bem perdido em relação à área'
                    'em que eu iria atuar. Para ser bem sincero, não sabia nada de programação,'
                    'então decidi me informar e esperar até que eu encontrasse uma área em que'
                    'eu realmente gostasse.\n\n'
                    'Após 1 semestre, comecei a estudar CSS e HTML, meu primeiro contato com o'
                    'Front-End e inclusive trabalhei para a estruturação de um projeto para uma'
                    'Instituição de doações, e aí que eu simplesmente me apaixonei no Front-End.'
                    'Devido a isso comecei a praticar mais e mais para me qualificar a um'
                    'emprego, e atualmente estou constantemente estudando para aprimorar'
                    'meus aprendizados e iniciar minha carreira como desenvolvedor Front-End.',
                    style: TextStyle(
                        color: Color.fromRGBO(197, 197, 197, 1),
                        fontSize: 12,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 150),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                const Text(
                  'about me',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 53,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(width: 10),
                Image.asset('lib/assets/4210456 2.png'),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(24, 14, 27, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color.fromRGBO(63, 63, 63, 1),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/fotoLinkedin2.png',
                    width: 337,
                    height: 398,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 50),
                  const Text(
                    'Olá, meu nome é Rodrigo Shiraishi Quadros, um apaixonado em criar\n'
                    'websites bonitos. Desde 2018, sou fascinado por qualquer coisa relacionada à\n'
                    'interfaces ou designs bem desenhados, e sempre desenvolvi minhas\n'
                    'habilidades desde então, fazendo logos, banners, designs gráficos em geral.\n\n'
                    'Em 2023, decidi entrar para o mundo de programação, estudando no\n'
                    'Instituto Mauá de Tecnologia, porém comecei bem perdido em relação à área\n'
                    'em que eu iria atuar. Para ser bem sincero, não sabia nada de programação,\n'
                    'então decidi me informar e esperar até que eu encontrasse uma área em que\n'
                    'eu realmente gostasse.\n\n'
                    'Após 1 semestre, comecei a estudar CSS e HTML, meu primeiro contato com o\n'
                    'Front-End e inclusive trabalhei para a estruturação de um projeto para uma\n'
                    'Instituição de doações, e aí que eu simplesmente me apaixonei no Front-End.\n'
                    'Devido a isso comecei a praticar mais e mais para me qualificar a um\n'
                    'emprego, e atualmente estou constantemente estudando para aprimorar\n'
                    'meus aprendizados e iniciar minha carreira como desenvolvedor Front-End.',
                    style: TextStyle(
                        color: Color.fromRGBO(197, 197, 197, 1),
                        fontSize: 15,
                        fontFamily: 'Poppins'),
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
