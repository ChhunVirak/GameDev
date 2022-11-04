import 'package:counter_me/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
            child: SvgPicture.asset('assets/play-button.svg'),
          ),
        ),
      ),
    );
  }
}
