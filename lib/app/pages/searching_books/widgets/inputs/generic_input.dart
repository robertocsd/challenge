import 'package:flutter/material.dart';

class GenerinInputWidget extends StatelessWidget {
  final Function(String) onWrite;
  final String? onError;
  final String? hintText;
  final String? keyboardType;
  final String? value;
  final String? initialValue;
  const GenerinInputWidget(
      {Key? key,
      required this.onWrite,
      this.onError,
      this.hintText,
      this.keyboardType,
      this.value, this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:initialValue == '' ? null : initialValue,
      maxLength: keyboardType == 'number' ? 10 : null,
      key: const Key('Input'),
      onChanged: (data) {
        onWrite(data);
      },
      keyboardType: keyboardType == 'number'
          ? TextInputType.number
          : keyboardType == 'text'
              ? TextInputType.text
              : keyboardType == 'email'
                  ? TextInputType.emailAddress
                  : TextInputType.text,
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
