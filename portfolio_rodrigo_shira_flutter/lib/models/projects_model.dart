import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsModel extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final String repolink;
  final String applink;

  const ProjectsModel({
    super.key,
    required this.title,
    required this.description,
    required this.image, required this.repolink, required this.applink,
  });

  @override
  State<ProjectsModel> createState() => _ProjectsModelState();
}

class _ProjectsModelState extends State<ProjectsModel> {
  static const double _shadowHeight = 4;
  double _position = 3;
  double _positionRight = 4;

  @override
  Widget build(BuildContext context) {
    const double height = 34 - _shadowHeight;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
      child: Column(
        children: [
          Image.asset(
            widget.image,
            width: 289,
            height: 273,
            fit: BoxFit.cover,
          ),
          Container(
            width: 289,
            height: 141,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
              color: Color.fromRGBO(34, 24, 36, 1),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.description,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 9,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            launch(widget.repolink);
                          },
                          child: const Text(
                            '< repository />',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            launch(widget.applink);
                          },
                          child: MouseRegion(
                            onExit: (_) {
                              setState(() {
                                _position = 3;
                                _positionRight = 4;
                              });
                            },
                            onEnter: (_) {
                              setState(() {
                                _position = 1;
                                _positionRight = 2;
                              });
                            },
                            child: SizedBox(
                              height: height + _shadowHeight,
                              width: 120,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 1,
                                    right: 2,
                                    child: Container(
                                      height: height,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(182, 50, 95, 1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedPositioned(
                                    curve: Curves.easeIn,
                                    bottom: _position,
                                    right: _positionRight,
                                    duration: const Duration(milliseconds: 150),
                                    child: Container(
                                      height: height,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(38, 23, 43, 1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Application',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(182, 50, 95, 1),
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
