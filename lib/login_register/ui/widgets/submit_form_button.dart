import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

class SubmitFormButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const SubmitFormButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ConstantComponents.firstColor,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Text(
          title, 
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}