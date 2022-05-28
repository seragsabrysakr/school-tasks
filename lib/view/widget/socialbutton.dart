import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback ontap;
  const SocialButton({Key? key, required this.color, required this.icon, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: color,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: ontap,
          icon: Icon(icon),
          color: color,
        )
      ),
    );
  }
}
