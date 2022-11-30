import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  userLogin() async {
    final token = await Magic.instance.auth
        .loginWithMagicLink(email: emailController.text);
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passwordless Authentication'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          !isLoading
              ? ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await userLogin();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text('Login'),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )
        ],
      ),
    );
  }
}
