import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isPassField;
  const CustomTextFormField({
    super.key,
    required this.title,
    this.controller,
    this.validator,
    this.isPassField = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPassShown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              obscureText: widget.isPassField && !_isPassShown,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: widget.title,
                suffixIcon: !widget.isPassField ? null : IconButton(
                  onPressed: () => setState(() => _isPassShown = !_isPassShown),
                  icon: Icon(_isPassShown 
                    ? Icons.remove_red_eye_outlined 
                    : Icons.remove_red_eye,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}