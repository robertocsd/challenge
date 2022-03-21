import 'package:flutter/material.dart';

class InputHome extends StatelessWidget {
  final Function(String) onWrite;
  final String? onError;
  final String? hintText;
  const InputHome(
      {Key? key, required this.onWrite, this.onError, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('Input'),
      onChanged: (data) {
        onWrite(data);
      },
      decoration: InputDecoration(
        errorText: onError,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        filled: true,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 95, 95, 95)),
        hintText: hintText,
        fillColor: const Color.fromARGB(255, 214, 207, 207),
      ),
    );
  }
}
