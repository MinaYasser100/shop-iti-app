

import 'package:flutter/material.dart';

Column navigationItemButton({
  required IconData icon,
  required void Function()? onPressed,
  required bool isActive,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 23,
          color: Colors.white,
        ),
      ),
      if (isActive)
        Container(
          height: 2,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: Colors.white,

          ),
        )
    ],
  );
}
