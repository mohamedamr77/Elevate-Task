import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final void Function() onTap;
  const AddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: GestureDetector(
        onTap: onTap,
        child: const CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xff004087),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}