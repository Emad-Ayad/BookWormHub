import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.magnifyingGlass))
          ],
        ),
      ),
    );
  }
}