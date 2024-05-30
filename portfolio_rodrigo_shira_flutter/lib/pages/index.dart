import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:portfolio_rodrigo_shira_flutter/models/gradient_text.dart';
import 'package:portfolio_rodrigo_shira_flutter/models/projects_model.dart';
import 'package:portfolio_rodrigo_shira_flutter/models/skills_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool _isFirstImage = true;
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  final Uri _url = Uri.parse(
      'https://www.dropbox.com/scl/fi/21mfu5iv7uau5o5wlw3tf/curriculo_rodrigo_shira_ofc.pdf?rlkey=pfkq6ogl09w61hknwyabl2n9h&st=w9niekm2&dl=0');

  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
    });
  }

  void _nextPage() {
    if (_pageController.page! < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void _scrollToSection(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 651) {
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              backgroundColor: const Color.fromRGBO(14, 8, 16, 1),
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Image.asset(
                    'lib/assets/ShiraLogoTipografia2-PNG-c2.png',
                    width: 100,
                    height: 100,
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.sunny),
                  ),
                ],
              ),
              actions: [],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildDrawerItem('Home', () {
                    _scrollToSection(0);
                  }),
                  _buildDrawerItem('About me', () {
                    _scrollToSection(820);
                  }),
                  _buildDrawerItem('Portfolio', () {
                    _scrollToSection(1450);
                  }),
                  _buildDrawerItem('Skills', () {
                    _scrollToSection(3000);
                  }),
                ],
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(18, 10, 20, 1),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    _buildHomeSection(),
                    const SizedBox(height: 0.05),
                    _buildAboutMeSection(),
                    _buildPortfolioSection(),
                    const SizedBox(height: 0.05),
                    _buildSkillsSection(),
                    _buildFooterSection(),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              mini: true,
              backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
              child: const Icon(Icons.keyboard_arrow_up, size: 20),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              backgroundColor: const Color.fromRGBO(14, 8, 16, 1),
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/assets/ShiraLogoTipografia2-PNG-c2.png',
                    width: 100,
                    height: 100,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 120),
                      _buildTextButton('Home', () {
                        _scrollToSection(0);
                      }),
                      _buildTextButton('About me', () {
                        _scrollToSection(820);
                      }),
                      _buildTextButton('Portfolio', () {
                        _scrollToSection(1450);
                      }),
                      _buildTextButton('Skills', () {
                        _scrollToSection(3000);
                      }),
                    ],
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.sunny),
                  ),
                ],
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(18, 10, 20, 1),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    _buildHomeSection(),
                    const SizedBox(height: 0.05),
                    _buildAboutMeSection(),
                    _buildPortfolioSection(),
                    const SizedBox(height: 0.05),
                    _buildSkillsSection(),
                    _buildFooterSection(),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              mini: true,
              backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
              child: const Icon(Icons.keyboard_arrow_up, size: 20),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
        }
      },
    );
  }

  Widget _buildDrawerItem(String text, VoidCallback onPressed) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      ),
      onTap: onPressed,
    );
  }

  Widget _buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      ),
    );
  }

  Widget _buildHomeSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth < 1010 && constraints.maxWidth > 651){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'lib/assets/ShiraLogo - Home.png',
                width: 350,
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Rodrigo Shiraishi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GradientText(
                      'Front-End Developer & UX/UI Designer',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(182, 50, 95, 1),
                          Color.fromRGBO(255, 136, 124, 1),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'I am a programming student focused on Web development and I\n'
                      'intend to expand my knowledge in order to improve my skills',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(222, 222, 222, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch(
                              'https://www.linkedin.com/in/rodrigo-shiraishi-quadros-a35a6424b/');
                        },
                        child: Image.asset('lib/assets/LinkedinIcon2 1.png',
                            width: 30, height: 30),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          launch('https://github.com/Roderigoshq');
                        },
                        child: Image.asset('lib/assets/GitHubIcon2 1.png',
                            width: 30, height: 30),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 51.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(182, 50, 95, 1),
                              Color.fromRGBO(255, 136, 124, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: _launchUrl,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                'Download CV',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(17, 10, 19, 1),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 50),
                      OutlineGradientButton(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(182, 50, 95, 1),
                            Color.fromRGBO(255, 136, 124, 1),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        strokeWidth: 1,
                        radius: Radius.circular(18),
                        child: GradientText(
                          'Contact Me',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(182, 50, 95, 1),
                              Color.fromRGBO(255, 136, 124, 1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }else if (constraints.maxWidth < 651) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'lib/assets/ShiraLogo - Home.png',
                width: 200,
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Rodrigo Shiraishi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GradientText(
                      'Front-End Developer & UX/UI Designer',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(182, 50, 95, 1),
                          Color.fromRGBO(255, 136, 124, 1),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'I am a programming student focused on Web development and I\n'
                      'intend to expand my knowledge in order to improve my skills',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(222, 222, 222, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch(
                              'https://www.linkedin.com/in/rodrigo-shiraishi-quadros-a35a6424b/');
                        },
                        child: Image.asset('lib/assets/LinkedinIcon2 1.png',
                            width: 30, height: 30),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          launch('https://github.com/Roderigoshq');
                        },
                        child: Image.asset('lib/assets/GitHubIcon2 1.png',
                            width: 30, height: 30),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 34.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(182, 50, 95, 1),
                              Color.fromRGBO(255, 136, 124, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: _launchUrl,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                'Download CV',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(17, 10, 19, 1),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      OutlineGradientButton(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(182, 50, 95, 1),
                            Color.fromRGBO(255, 136, 124, 1),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        strokeWidth: 1,
                        radius: Radius.circular(18),
                        child: GradientText(
                          'Contact Me',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(182, 50, 95, 1),
                              Color.fromRGBO(255, 136, 124, 1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GradientText(
                      'Front-End Developer & UX/UI Designer',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(182, 50, 95, 1),
                          Color.fromRGBO(255, 136, 124, 1),
                        ],
                      ),
                    ),
                    const Text(
                      'Rodrigo Shiraishi',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 70,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'I am a programming student focused on Web development and I\n'
                      'intend to expand my knowledge in order to improve my skills',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(222, 222, 222, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launch(
                                  'https://www.linkedin.com/in/rodrigo-shiraishi-quadros-a35a6424b/');
                            },
                            child:
                                Image.asset('lib/assets/LinkedinIcon2 1.png'),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              launch('https://github.com/Roderigoshq');
                            },
                            child: Image.asset('lib/assets/GitHubIcon2 1.png'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(182, 50, 95, 1),
                              Color.fromRGBO(255, 136, 124, 1),
                            ]),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: ElevatedButton(
                            onPressed: _launchUrl,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Text(
                              'Download CV',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(17, 10, 19, 1),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: OutlineGradientButton(
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(182, 50, 95, 1),
                              Color.fromRGBO(255, 136, 124, 1),
                            ]),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 33, vertical: 12),
                            strokeWidth: 1,
                            radius: const Radius.circular(18),
                            child: const GradientText(
                              'Contact Me',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(182, 50, 95, 1),
                                  Color.fromRGBO(255, 136, 124, 1),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset('lib/assets/ShiraLogo - Home.png'),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildAboutMeSection() {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1300) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 100),
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
                    Image.asset('lib/assets/4210456 2.png', width: 28,),
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
      } else {
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
    });
  }

  Widget _buildPortfolioSection() {
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(24, 14, 27, 1),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 51),
                  child: SizedBox(
                    height: 150,
                    width: 600,
                    child: Stack(
                      children: [
                        Text(
                          'a little bit of my',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 44,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Positioned(
                          left: 0, // Ajuste conforme necessário
                          bottom: -40, // Ajuste conforme necessário
                          child: GradientText(
                            'Portfolio',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 122,
                              fontWeight: FontWeight.w600,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(182, 50, 95, 1),
                                Color.fromRGBO(255, 136, 124, 1),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProjectsModel(
                  title: 'Shira Climates',
                  description:
                      'Consulte o clima de uma determinada cidade, estado ou até mesmo país!',
                  image: 'lib/assets/shiraclimates.png',
                  repolink:
                      'https://github.com/Roderigoshq/Shira_Climates_Consulta_Do_Clima',
                  applink: 'https://shiraclimates.netlify.app/',
                ),
                ProjectsModel(
                  title: 'Em breve',
                  description: 'Em breve',
                  image: 'lib/assets/ShiraLogoTipografia2-PNG-c2.png',
                  repolink: '',
                  applink: '',
                ),
                ProjectsModel(
                  title: 'Em breve',
                  description: 'Em breve',
                  image: 'lib/assets/ShiraLogoTipografia2-PNG-c2.png',
                  repolink: '',
                  applink: '',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProjectsModel(
                  title: 'Em breve',
                  description: 'Em breve',
                  image: 'lib/assets/ShiraLogoTipografia2-PNG-c2.png',
                  applink: '',
                  repolink: '',
                ),
                ProjectsModel(
                  title: 'Em breve',
                  description: 'Em breve',
                  image: 'lib/assets/ShiraLogoTipografia2-PNG-c2.png',
                  applink: '',
                  repolink: '',
                ),
                ProjectsModel(
                  title: 'Em breve',
                  description: 'Em breve',
                  image: 'lib/assets/ShiraLogoTipografia2-PNG-c2.png',
                  repolink: '',
                  applink: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _toggleImage,
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Image.asset(
                      _isFirstImage
                          ? 'lib/assets/ShiraLogo-PNG-C-3d(2)-(1) 43.png'
                          : 'lib/assets/ShiraLogo-PNG-C-3d(2)-(1)2 12.png',
                      key: ValueKey<bool>(_isFirstImage),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 23,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 64),
                child: Row(
                  children: [
                    Text(
                      'Skills',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 87,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 54,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(182, 50, 95, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: _previousPage,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 550,
                    height: 800,
                    child: PageView(
                      controller: _pageController,
                      children: const [
                        Column(
                          children: [
                            Row(
                              children: [
                                SkillsModel(
                                  image: 'lib/assets/HTML-logo 2.png',
                                  title: 'HTML',
                                ),
                                SkillsModel(
                                  image: 'lib/assets/CSS-logo-3 2.png',
                                  title: 'CSS',
                                ),
                                SkillsModel(
                                  image: 'lib/assets/Flutter_logo.svg.png',
                                  title: 'Flutter',
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SkillsModel(
                                    image: 'lib/assets/Bootstrap_logo-c 1.png',
                                    title: 'BootStrap'),
                                SkillsModel(
                                    image:
                                        'lib/assets/Javascript_badge-c 1.png',
                                    title: 'JavaScript'),
                                SkillsModel(
                                    image: 'lib/assets/Dart-logo.png',
                                    title: 'Dart'),
                              ],
                            ),
                            Row(
                              children: [
                                SkillsModel(
                                    image: 'lib/assets/MySQL_textlogo 1.png',
                                    title: 'MySQL'),
                                SkillsModel(
                                    image: 'lib/assets/Git-Icon-1788C-c 1.png',
                                    title: 'Git'),
                                SkillsModel(
                                    image:
                                        'lib/assets/Python-logo-notext 1.png',
                                    title: 'Python'),
                              ],
                            ),
                            Row(
                              children: [
                                SkillsModel(
                                    image:
                                        'lib/assets/WordPress_blue_logo-c 1.png',
                                    title: 'Wordpress'),
                                SkillsModel(
                                    image:
                                        'lib/assets/1667px-Figma-logo-c 1.png',
                                    title: 'Figma'),
                                SkillsModel(
                                    image:
                                        'lib/assets/Adobe_Photoshop_CC_icon-c 1.png',
                                    title: 'Photoshop'),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SkillsModel(
                                  image: 'lib/assets/unnamed 1.png',
                                  title: 'C',
                                ),
                                SkillsModel(
                                  image:
                                      'lib/assets/firebase_logo_icon_171157.png',
                                  title: 'Firebase',
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onPressed: _nextPage,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection() {
    return Container(
      color: const Color.fromRGBO(30, 17, 34, 1),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '<',
              style: TextStyle(
                  color: Color.fromRGBO(182, 50, 95, 1),
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              ' Feito com carinho por ',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Rodrigo Shiraishi />',
              style: TextStyle(
                  color: Color.fromRGBO(182, 50, 95, 1),
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
