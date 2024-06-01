import 'package:flutter/material.dart';
import 'package:portfolio_rodrigo_shira_flutter/models/gradient_text.dart';
import 'package:portfolio_rodrigo_shira_flutter/models/projects_model.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 651) {
          return _buildSmallScreen();
        } else {
          return _buildLargeScreen();
        }
      },
    );
  }

  Widget _buildSmallScreen() {
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(24, 14, 27, 1),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Text(
                  'a little bit of my',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                GradientText(
                  'Portfolio',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 64,
                    fontWeight: FontWeight.w600,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(182, 50, 95, 1),
                      Color.fromRGBO(255, 136, 124, 1),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.center,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeScreen() {
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
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: -40,
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
            Center(
              child: Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.center,
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
            ),
          ],
        ),
      ),
    );
  }
}
