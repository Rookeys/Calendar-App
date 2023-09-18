import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LinkText extends StatelessWidget {
  final Icon icon;
  final Text text;
  final String? route;
  final Function? onTap;

  const LinkText({
    Key? key,
    required this.icon,
    required this.text,
    this.route,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          context.go(route!);
        } else if (onTap != null) {
          onTap!();
        }
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 10),
          text,
        ],
      ),
    );
  }
}
