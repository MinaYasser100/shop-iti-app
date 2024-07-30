import 'package:flutter/material.dart';

Column navigationItemButton({
  required IconData icon,
  required void Function()? onPressed,
}) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      Container(
        height: 2,
        width: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          color: Colors.white,
        ),
      )
    ],
  );
}
