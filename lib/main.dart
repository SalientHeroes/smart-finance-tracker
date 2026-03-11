import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const LedgrApp());
}

class LedgrApp extends StatelessWidget {
  const LedgrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LEDGR',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      home: const Scaffold(body: Center(child: Text('LEDGR is alive! 🌿'))),
    );
  }
}
