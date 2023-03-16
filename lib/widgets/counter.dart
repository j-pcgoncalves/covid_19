import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  const Counter({
    super.key,
    required this.number,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
