import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarCustom extends StatelessWidget {
  final List<NavBarCustomChildren>? children;

  // ignore: use_key_in_widget_constructors
  const NavBarCustom({this.children});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(
                5.0,
                5.0,
              ),
            ),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children!),
      ),
    );
  }
}

class NavBarCustomChildren extends StatelessWidget {
  final String? path;

  final Color? color;

  final Function()? onTap;
  // ignore: use_key_in_widget_constructors
  const NavBarCustomChildren({this.path, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child:
            SvgPicture.asset(path!, color: color, width: 22.0, height: 22.0));
  }
}
