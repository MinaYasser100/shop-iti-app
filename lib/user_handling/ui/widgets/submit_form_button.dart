
import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

class SubmitFormButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color bgColor;
  final double width;
  const SubmitFormButton({
    super.key,
    required this.title,
    this.onTap,
    this.bgColor = ConstantComponents.firstColor,
    this.width = double.infinity,
  });
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(30),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}