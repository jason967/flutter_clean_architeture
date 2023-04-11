import 'package:go_router/go_router.dart';

import 'category/category.page.dart';
import 'main.page.dart';
import 'search/search.page.dart';

final GoRouter blocRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      name: 'category',
      path: '/category',
      builder: (context, state) => const CategoryPage(),
    ),
    GoRoute(
      name: 'search',
      path: '/search',
      builder: (context, state) => const SearchPage(),
    ),
  ],
);
