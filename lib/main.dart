import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/stories_viewer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recap 2022',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/:id',
      builder: (context, state) {
        final id = state.params['id'] ?? '';
        return StoriesViewerPage(id: id);
      },
    ),
  ],
);
