import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "📞 Calls\nNo recent calls",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
