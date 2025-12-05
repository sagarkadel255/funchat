import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_snackbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      CustomSnackbar.show(context, 'Please fill all fields');
    } else {
      CustomSnackbar.show(context, 'Account Created');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Main logo/icon
                const Icon(
                  Icons.chat_bubble,
                  color: Colors.redAccent,
                  size: 100,
                ),
                const SizedBox(height: 30),

                CustomTextField(hint: 'Name', controller: nameController),
                const SizedBox(height: 15),
                CustomTextField(hint: 'Phone', controller: phoneController),
                const SizedBox(height: 15),
                CustomTextField(hint: 'Email', controller: emailController),
                const SizedBox(height: 15),
                CustomTextField(
                    hint: 'Password',
                    controller: passwordController,
                    obscureText: true),
                const SizedBox(height: 25),

                CustomButton(text: 'Register', onPressed: _register),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Color.fromARGB(255, 245, 2, 2)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
