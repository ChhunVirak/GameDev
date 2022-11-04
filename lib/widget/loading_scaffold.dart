import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScafold extends StatelessWidget {
  final bool loading;
  final Scaffold? scafold;
  const LoadingScafold({Key? key, this.loading = false, this.scafold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        scafold!,
        loading
            ? Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LottieBuilder.asset('assets/loading.json'),
                      const Text('Loading . . .')
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
