import 'package:go_router/go_router.dart';

import '../main/main_screen.dart';
import '../pages/category/category_page.dart';
import '../pages/splash/splash_page.dart';
import 'route_path.dart';

//라우터 경로 설정!
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.splash,
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RoutePath.main,
      name: "main",
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: RoutePath.category,
      name: "category",
      builder: (context, state) => const CategoryPage(),
    ),
  ],
  initialLocation: "/splash", // 초기 화면 경로 설정
);
