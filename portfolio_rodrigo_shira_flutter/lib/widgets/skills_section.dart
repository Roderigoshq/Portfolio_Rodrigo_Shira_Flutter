import 'package:flutter/material.dart';
import 'package:portfolio_rodrigo_shira_flutter/models/skills_model.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  SkillsSectionState createState() => SkillsSectionState();
}

class SkillsSectionState extends State<SkillsSection> {
  bool _isFirstImage = true;

  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isNotLargeScreen =
        MediaQuery.of(context).size.width > 1271 &&
            MediaQuery.of(context).size.width > 651;
    final bool isSmallScreen =
        MediaQuery.of(context).size.width <= 651;

    double spacing = isSmallScreen ? 15 : 60;
    double runSpacing = isSmallScreen ? 30 : 60;
    double horizontalPadding = isSmallScreen ? 30 : 100;
    double sizedBoxWidth = isSmallScreen ? 0 : 60;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Visibility(
                visible: isNotLargeScreen,
                child: Column(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: _toggleImage,
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          transitionBuilder: (Widget child,
                              Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
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
              ),
              SizedBox(
                width: sizedBoxWidth,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: isSmallScreen
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: isSmallScreen
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: const [
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
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: spacing,
                      runSpacing: runSpacing,
                      children: const [
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
                        SkillsModel(
                          image: 'lib/assets/Bootstrap_logo-c 1.png',
                          title: 'BootStrap',
                        ),
                        SkillsModel(
                          image: 'lib/assets/Javascript_badge-c 1.png',
                          title: 'JavaScript',
                        ),
                        SkillsModel(
                          image: 'lib/assets/Dart-logo.png',
                          title: 'Dart',
                        ),
                        SkillsModel(
                          image: 'lib/assets/MySQL_textlogo 1.png',
                          title: 'MySQL',
                        ),
                        SkillsModel(
                          image: 'lib/assets/Git-Icon-1788C-c 1.png',
                          title: 'Git',
                        ),
                        SkillsModel(
                          image: 'lib/assets/Python-logo-notext 1.png',
                          title: 'Python',
                        ),
                        SkillsModel(
                          image: 'lib/assets/WordPress_blue_logo-c 1.png',
                          title: 'Wordpress',
                        ),
                        SkillsModel(
                          image: 'lib/assets/1667px-Figma-logo-c 1.png',
                          title: 'Figma',
                        ),
                        SkillsModel(
                          image: 'lib/assets/Adobe_Photoshop_CC_icon-c 1.png',
                          title: 'Photoshop',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
