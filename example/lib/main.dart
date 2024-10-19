// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:watermark_widget/watermark_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watermark Widget Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watermark Widget Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Small Container Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            WatermarkWidget(
              text: 'DEMO',
              opacity: 0.2,
              color: Colors.red,
              rotationAngle: -0.5,
              fontSize: 14,
              horizontalInterval: 100,
              verticalInterval: 50,
              child: Container(
                width: 300,
                height: 150,
                color: Colors.blue[100],
                child: const Center(child: Text('Small Container')),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Large Container Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            WatermarkWidget(
              text: 'WATERMARK',
              opacity: 0.1,
              color: Colors.green,
              rotationAngle: -0.3,
              fontSize: 24,
              horizontalInterval: 200,
              verticalInterval: 100,
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.yellow[100],
                child: const Center(child: Text('Large Container')),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Tips for configuration:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Adjust fontSize based on container size (larger containers need larger font sizes)',
              style: TextStyle(fontSize: 14),
            ),
            const Text(
              '• Set horizontalInterval and verticalInterval to control spacing',
              style: TextStyle(fontSize: 14),
            ),
            const Text(
              '• Use opacity to control the visibility of the watermark',
              style: TextStyle(fontSize: 14),
            ),
            const Text(
              '• rotationAngle is in radians (-0.5 is about -28.6 degrees)',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
