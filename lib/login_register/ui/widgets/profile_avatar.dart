import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAvatar extends StatefulWidget {
  final void Function()? onTap;
  final ImageProvider? image;
  final double radius;
  const ProfileAvatar({
    super.key,
    this.image,
    this.onTap,
    this.radius = 80,
  });

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) => InkWell(
    onHover: (v) => setState(() => _hovered = v,),
    onTap: widget.onTap,
    borderRadius: BorderRadius.circular(1000),
    child: Stack(
      alignment: Alignment.center,
      children: [
        widget.image == null 
        ? CircleAvatar(
          radius: widget.radius,
          child: Icon(
            Icons.person, 
            size: widget.radius * (150 / 80),
            color: Colors.white,
          ),
        )
        : Image(
          image: widget.image!,
          errorBuilder: (context, _, __) => CircleAvatar(
            radius: widget.radius,
            child: Icon(
              Icons.broken_image, 
              size: widget.radius,
              color: Colors.red,
            ),
          ),
        ),
        if(_hovered) CircleAvatar(
          radius: widget.radius * (7 / 8),
          backgroundColor: Colors.grey.withOpacity(0.7),
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}