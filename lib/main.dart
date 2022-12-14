import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'loading_animation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoadingAnimation(),
    );
  }
}
