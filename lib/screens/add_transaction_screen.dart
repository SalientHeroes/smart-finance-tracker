import 'package:flutter/material.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('➕ Add New Transaction'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Transaction Form Coming Soon!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
