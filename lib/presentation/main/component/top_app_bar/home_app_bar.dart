import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/constant/app_colors.dart';
import '../../../../core/theme/constant/app_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 44,
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
        child: Row(
          children: [
            SizedBox(
              width: 86,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.mainLogo),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Main Screen",
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.location,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.background,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.cart,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.background,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}