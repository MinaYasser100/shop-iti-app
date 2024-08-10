import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isPassField;
  final Widget? prefixIcon;
  final bool readOnly;


  const CustomTextFormField({
    super.key,
    required this.title,
    this.controller,
    this.validator,
    this.isPassField = false,
    this.prefixIcon,
    this.readOnly = false,
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
      height: 85,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              obscureText: widget.isPassField && !_isPassShown,
              readOnly: widget.readOnly,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none
                ),

                labelText: widget.title,
                prefixIcon: widget.prefixIcon,
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