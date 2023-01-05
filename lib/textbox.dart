import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  final TextEditingController? textHandler;
  Textbox(this.textHandler);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: textHandler,
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white)),
            hintText: 'Enter a task',
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
