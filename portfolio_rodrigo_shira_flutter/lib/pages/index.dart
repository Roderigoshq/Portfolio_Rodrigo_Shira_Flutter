import 'package:flutter/material.dart';


class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(14, 8, 16, 1),
        automaticallyImplyLeading: false,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            'lib/assets/ShiraLogoTipografia2-PNG-c2.png',
            width: 100,
            height: 100,
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'About me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Portfolio',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Skills',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.sunny),
          )
        ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(18, 10, 20, 1), // Cor de fundo desejada
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Alinha a coluna centralizada horizontalmente
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Alinha os elementos centralizados verticalmente
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Front-End Developer & UX/UI Designer',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 136, 124, 1)),
                  ),
                  Text('Rodrigo Shiraishi',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 70,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  Text(
                      'I am a programming student focused on Web development and I\n intend to expand my knowledge in order to improve my skills',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(222, 222, 222, 1),
                      )),
                  Row(
                    children: [
                      Image.asset('lib/assets/GitHubIcon2 1.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('lib/assets/LinkedinIcon2 1.png'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    // Coluna para centralizar os botões verticalmente
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Download CV',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(17, 10, 19, 1),
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 136, 124, 1),
                            foregroundColor: Color.fromRGBO(17, 10, 19, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 18)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Contact me',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Color.fromRGBO(255, 136, 124, 1),
                            disabledBackgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            side: BorderSide(
                                color: Color.fromRGBO(255, 136, 124, 1)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 18)),
                      )
                    ],
                  ),
                ],
              ),
              Image.asset('lib/assets/ShiraLogo - Home.png'),
            ],
          ),
        ),
      ),
    );
  }
}
