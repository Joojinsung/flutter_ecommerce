import 'package:flutter/material.dart';
import 'core/theme/theme_data.dart';
import 'presentation/routes/routes.dart';



void main() {
  return (runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //라우터 등록하기
    return MaterialApp.router(
      routerConfig: router,
      //theme 적용
      theme: CustomThemeData.themeData,
    );
  }
}
