import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:portfolio_rodrigo_shira_flutter/models/gradient_text.dart';
import 'package:portfolio_rodrigo_shira_flutter/widgets/aboutme_section.dart';
import 'package:portfolio_rodrigo_shira_flutter/widgets/footer_section.dart';
import 'package:portfolio_rodrigo_shira_flutter/widgets/portfolio_section.dart';
import 'package:portfolio_rodrigo_shira_flutter/widgets/skills_section.dart';
import 'package:url_launcher/url_launcher.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final ScrollController _scrollController = ScrollController();
  final Uri _url = Uri.parse(
      'https://www.dropbox.com/scl/fi/21mfu5iv7uau5o5wlw3tf/curriculo_rodrigo_shira_ofc.pdf?rlkey=pfkq6ogl09w61hknwyabl2n9h&st=w9niekm2&dl=0');




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
                   Builder(
  builder: (context) => IconButton(
    onPressed: () {
      Scaffold.of(context).openDrawer(); // Agora o Scaffold.of() terá acesso ao Scaffold
    },
    icon: const Icon(Icons.menu, color: Colors.white,),
  ),
),
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
              actions: const [],
            ),
            drawer: Drawer(
              backgroundColor: const Color.fromRGBO(24, 14, 27, 1),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildDrawerItem('Home', () {
                    _scrollToSection(0);
                    Navigator.of(context).pop();
                  }),
                  _buildDrawerItem('About me', () {
                    _scrollToSection(820);
                    Navigator.of(context).pop();
                  }),
                  _buildDrawerItem('Portfolio', () {
                    _scrollToSection(1450);
                    Navigator.of(context).pop();
                  }),
                  _buildDrawerItem('Skills', () {
                    _scrollToSection(3000);
                    Navigator.of(context).pop();
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
                    const AboutMeSection(),
                    const PortfolioSection(),
                    const SizedBox(height: 0.05),
                    const SkillsSection(),
                    const FooterSection(),
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
                    const AboutMeSection(),
                    const PortfolioSection(),
                    const SizedBox(height: 0.05),
                    const SkillsSection(),
                    const FooterSection(),
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
      title: Row(
        children: [
          Text(
            text,
            style: const TextStyle(color: Color.fromRGBO(217, 217, 217, 1), fontFamily: 'Poppins', fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Icon(Icons.arrow_right_rounded)
        ],
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
        if (constraints.maxWidth < 1010 && constraints.maxWidth > 651) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'lib/assets/ShiraLogo - Home.png',
                width: 350,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Rodrigo Shiraishi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            launch(
                                'https://www.linkedin.com/in/rodrigo-shiraishi-quadros-a35a6424b/');
                          },
                          child: Image.asset('lib/assets/LinkedinIcon2 1.png',
                              width: 30, height: 30),
                        ),
                      ),
                      const SizedBox(width: 10),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            launch('https://github.com/Roderigoshq');
                          },
                          child: Image.asset('lib/assets/GitHubIcon2 1.png',
                              width: 30, height: 30),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 51.0,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
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
                              child: const Text(
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
                      const SizedBox(width: 50),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: OutlineGradientButton(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(182, 50, 95, 1),
                              Color.fromRGBO(255, 136, 124, 1),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          strokeWidth: 1,
                          radius: const Radius.circular(18),
                          child: const MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else if (constraints.maxWidth < 651) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'lib/assets/ShiraLogo - Home.png',
                width: 200,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Rodrigo Shiraishi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                  const SizedBox(height: 20),
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
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          launch('https://github.com/Roderigoshq');
                        },
                        child: Image.asset('lib/assets/GitHubIcon2 1.png',
                            width: 30, height: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 34.0,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
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
                              child: const Text(
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
                      const SizedBox(width: 10),
                      OutlineGradientButton(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(182, 50, 95, 1),
                            Color.fromRGBO(255, 136, 124, 1),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        strokeWidth: 1,
                        radius: const Radius.circular(18),
                        child: const GradientText(
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

}
