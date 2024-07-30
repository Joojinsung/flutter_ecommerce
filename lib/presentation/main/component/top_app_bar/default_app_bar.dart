import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/constant/app_colors.dart';
import '../../../../core/theme/constant/app_icons.dart';
import '../../cubit/bottom_nav_cubit.dart';
import '../../cubit/mall_type_cubit.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar(this.bottomNavState, {super.key});

  final BottomNavState bottomNavState;

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        color: (state.isMarket)
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.background,
        child: AppBar(
          title: Text(
            bottomNavState.toName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: state.isMarket
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.primary,
                ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
      );
    });
  }
}
