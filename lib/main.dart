import 'package:flutter/material.dart';

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
      home: const Scaffold(body: Center(child: Text('LEDGR is alive! 🌿'))),
    );
  }
}
