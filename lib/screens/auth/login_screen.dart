import 'package:flutter/material.dart';
import 'register_screen.dart';
import '../home_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_snackbar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key}); // <-- Remove 'const'

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              CustomTextField(hint: 'Email', controller: emailController),
              const SizedBox(height: 15),
              CustomTextField(hint: 'Password', controller: passwordController, obscureText: true),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                    CustomSnackbar.show(context, 'Please fill all fields');
                  } else {
                    CustomSnackbar.show(context, 'Login Successful');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RegisterScreen()),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
