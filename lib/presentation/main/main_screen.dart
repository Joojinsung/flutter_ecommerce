import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/constant/app_icons.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("tabBar"),
        leading: IconButton(
          onPressed:(){}, icon: SvgPicture.asset(AppIcons.mainLogo),),
      ),
      body: Center(child: Text("main screen")),
    );
  }
}