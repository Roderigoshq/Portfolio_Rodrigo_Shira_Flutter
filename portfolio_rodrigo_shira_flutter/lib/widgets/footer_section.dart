import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width <= 651;
    return Container(
      color: const Color.fromRGBO(30, 17, 34, 1),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '<',
              style: TextStyle(
                  color: const Color.fromRGBO(182, 50, 95, 1),
                  fontFamily: 'Poppins',
                  fontSize: isSmallScreen ? 10 : 13,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              ' Feito com carinho por ',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: isSmallScreen ? 10 : 13,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Rodrigo Shiraishi />',
              style: TextStyle(
                  color: const Color.fromRGBO(182, 50, 95, 1),
                  fontFamily: 'Poppins',
                  fontSize: isSmallScreen ? 10 : 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
