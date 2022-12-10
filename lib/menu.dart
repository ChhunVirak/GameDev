import 'package:counter_me/home.dart';
import 'package:counter_me/module/home/widget/loading_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  void _initialController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController?.forward();
    // _animationController!.repeat();
    _animationController?.addListener(() {
      // if (_animationController!.isCompleted) {
      //   _animationController!.reverse();
      // }
      // if (_animationController!.isDismissed) {
      //   _animationController!.forward();
      // }
      setState(() {});
    });
  }

  void _disposeAnimation() {
    _animationController?.dispose();
  }

  @override
  void initState() {
    _initialController();
    super.initState();
  }

  @override
  void dispose() {
    _disposeAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScafold(
      // loading: true,
      scafold: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LottieBuilder.asset(
                'assets/game_banner.json',
                height: 300,
                fit: BoxFit.cover,
                repeat: false,
              ),
              AnimatedBuilder(
                animation: CurvedAnimation(
                    parent: _animationController!, curve: Curves.easeInOut),
                builder: (_, child) => ScaleTransition(
                  scale: Tween<double>(begin: 1, end: 1.2)
                      .animate(_animationController!),
                  child: child,
                ),
                child: const MenuButton(
                  size: Size(100, 100),
                  assetIcon: 'assets/play-button.svg',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  MenuButton(
                    assetIcon: 'assets/setting.svg',
                  ),
                  MenuButton(
                    assetIcon: 'assets/setting.svg',
                  ),
                  MenuButton(
                    assetIcon: 'assets/setting.svg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final Size size;
  final String? assetIcon;

  const MenuButton({
    Key? key,
    this.size = const Size(50, 50),
    required this.assetIcon,
  }) : super(key: key);

  Widget _getIcon() {
    if (assetIcon == null || assetIcon!.isEmpty) {
      return const SizedBox.shrink();
    } else if (assetIcon!.endsWith('svg')) {
      return SvgPicture.asset(assetIcon!);
    } else {
      return Image.asset(assetIcon!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        },
        child: _getIcon(),
      ),
    );
  }
}
