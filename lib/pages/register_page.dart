import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();
    if (passwordController.text == confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
        // Navigate to HomePage or show success message
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        print("error");
      }
    } else {
      // Show error message if passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            // welcome message
            Text(
              'Connect. Converse. Community.',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 20),
            // email input
            SizedBox(
              width: 450, // Set the desired width
              child: MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
              ),
            ),
            const SizedBox(height: 20),
            // password input
            SizedBox(
              width: 450, // Set the desired width
              child: MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
            ),
            const SizedBox(height: 20),
            // confirm password input
            SizedBox(
              width: 450, // Set the desired width
              child: MyTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: confirmPasswordController,
              ),
            ),
            const SizedBox(height: 20),
            // register button
            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(height: 20),
            // login button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16.0,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}