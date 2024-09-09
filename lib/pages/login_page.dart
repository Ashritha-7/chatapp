import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final VoidCallback onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    // auth logic here
    final AuthService _auth = AuthService();

    // try login
    try {
      await _auth.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
      // Navigate to HomePage on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      print("error");
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
            // login button
            MyButton(
              text: 'Login',
              onTap: () => login(context),
            ),
            const SizedBox(height: 20),
            // register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16.0,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now',
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