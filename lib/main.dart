import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

import 'login_page.dart';

void main() {
  runApp(const MyApp());

  Magic.instance = Magic('pk_live_6657075CFE189FDF');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          const LoginPage(),
          Magic.instance.relayer,
        ],
      ),
    );
  }
}
