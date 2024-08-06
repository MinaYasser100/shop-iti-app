import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const PageTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) => RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "$title\n",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: subTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ],
    ),
  );
}