import 'package:animai/home_page/home_page.dart';
import 'package:animai/opsai/opsai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<OpsAiProvider>(
    create: (_) => OpsAiProvider(),
    child: const AnimAiApp(),
  ));
}

class AnimAiApp extends StatelessWidget {
  const AnimAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
