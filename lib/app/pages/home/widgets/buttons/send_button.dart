import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final Function? onPress;

  const SendButton({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,),
      key: const Key('Button'),
      color: const Color.fromARGB(255, 214, 207, 207),
      child: const Icon(Icons.send),
      onPressed: () {
        onPress!();
      },
    );
  }
}
