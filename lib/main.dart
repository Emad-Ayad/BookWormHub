import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash_screen/presentation/view/splash_screen.dart';

void main() {
  runApp(const BookWormHub());
}

class BookWormHub extends StatelessWidget {
  const BookWormHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
