import 'package:book_worm_hub/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/assets.gen.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.panda.image(height: 80),
            const Spacer(),
            IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSearchRoute);               },
                icon: const Icon(FontAwesomeIcons.magnifyingGlass))
          ],
        ),
      ),
    );
  }
}