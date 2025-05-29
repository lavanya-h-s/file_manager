import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Photos")),
      body: const Center(
        child: Text("Photo Gallery Coming Soon"),
      ),
    );
  }
}
