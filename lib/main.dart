import 'package:flutter/material.dart';

import 'screens/stories_viewer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recap 2022',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StoriesViewerPage(),
    );
  }
}
