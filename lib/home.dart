import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;
  AnimationController? _animationController2;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    Future.delayed(const Duration(milliseconds: 2000), () {
      _animationController?.forward();
    });

    _animationController?.addListener(() {
      setState(() {
        if (_animationController!.isCompleted) {
          _animationController2?.forward();
        }
      });
    });

    _animationController2?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _animationController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animationController!.value == 0) {
            _animationController?.forward();
          } else {
            _animationController?.reverse();
          }
        },
        child: const Icon(Icons.replay),
      ),
      body: Stack(
        children: [
          SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(-1, 12), end: const Offset(20, 10))
                .animate(CurvedAnimation(
                    parent: _animationController2!, curve: Curves.linear)),
            child: const SizedBox(
              // color: Colors.red,
              width: 50,
              child: FittedBox(
                child: Icon(
                  Icons.star,
                ),
              ),
            ),
          ),
          SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0.45, -1), end: const Offset(0.45, 2.5))
                .animate(CurvedAnimation(
                    parent: _animationController!,
                    curve: Curves.fastLinearToSlowEaseIn)),
            child: const SizedBox(
              // color: Colors.red,
              width: 200,
              child: FittedBox(
                child: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
