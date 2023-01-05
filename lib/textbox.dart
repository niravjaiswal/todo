import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  final TextEditingController? textHandler;
  Textbox(this.textHandler);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textHandler,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a task',
        ),
      ),
    );
  }
}
