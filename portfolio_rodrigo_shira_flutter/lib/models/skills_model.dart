import 'package:flutter/material.dart';

class SkillsModel extends StatefulWidget {
  final String image;
  final String title;

  const SkillsModel({super.key, required this.image, required this.title});

  @override
  SkillsModelState createState() => SkillsModelState();
}

class SkillsModelState extends State<SkillsModel> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: _isHovered
              ? const Color.fromRGBO(45, 25, 50, 1) // Lighter color when hovered
              : const Color.fromRGBO(30, 17, 34, 1), // Original color
          border: Border.all(
            color: const Color.fromRGBO(63, 63, 63, 1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              fit: BoxFit.contain,
              width: 70,
              height: 70,
            ),
            const SizedBox(height: 15),
            Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
