import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.group, size: 120, color: Colors.redAccent),
          SizedBox(height: 30),
          Text("Connect with People",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Join groups, share moments & stay updated.",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
