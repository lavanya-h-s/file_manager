import 'package:flutter/material.dart';

class Source_Button extends StatelessWidget {
  final String title;
  final IconData icon;

  const Source_Button({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(title),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Opening $title')),
        );
      },
    );
  }
}