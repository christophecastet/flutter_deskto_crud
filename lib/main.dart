import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_desktop_app/user/presentation/user.page.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Open the personBox
  //await Hive.openBox('personBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People Info'),
      ),
      body: const UserPage(),
    );
  }
}
