import 'package:flutter/material.dart';
import 'package:mntk/widgets/animated_container.dart';
import 'package:mntk/widgets/animated_cross_fade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'simple animation',
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('simple animation'),
        backgroundColor: Colors.blue[100],

      ),
      body: const Padding(
          padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          AnimatedContainerWidget(),
          Divider(),
          AnimatedCrossFadeWidget(),
        ],
      ),
      ),
    );
  }
}


