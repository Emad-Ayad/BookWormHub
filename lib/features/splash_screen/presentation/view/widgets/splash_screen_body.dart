import 'package:book_worm_hub/core/utils/app_router.dart';
import 'package:book_worm_hub/gen/assets.gen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/styles.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  double opacityLevel = 0.0;

  @override
  void initState() {
    initSlidingAnimation();
    startFadeAnimation();
    navigateToHome();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            children: [
              Assets.images.book.image(),
              Positioned(
                right: MediaQuery.sizeOf(context).width*0.3,
                bottom: MediaQuery.sizeOf(context).height*0.06,
                child: AnimatedBuilder(
                  animation: slidingAnimation,
                  builder: (context, _) {
                    return SlideTransition(
                      position: slidingAnimation,
                      child: AnimatedOpacity(
                        curve: Curves.easeInOut,
                        duration: const Duration(seconds: 1),
                        opacity: opacityLevel,
                        child: const Text(
                          "Read Free Books",
                          style: Styles.bodyText18,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween(begin: const Offset(0, 2), end: const Offset(0, 0))
        .animate(animationController);
    animationController.forward();
  }

  void startFadeAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        opacityLevel = 1.0; // Fully visible
      });
    });
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
        GoRouter.of(context).pushReplacement(AppRouter.kHomeRoute);
      },
    );
  }
}
