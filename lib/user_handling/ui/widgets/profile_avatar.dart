import 'package:flutter/material.dart';

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
        ClipOval(
          child: CircleAvatar(
            radius: widget.radius,
            child: widget.image == null 
              ? Icon(
                Icons.person, 
                size: widget.radius * (150 / 80),
                color: Colors.white,
              )
              : Image(
                image: widget.image!,
                errorBuilder: (context, _, __) => Icon(
                  Icons.broken_image, 
                  size: widget.radius,
                  color: Colors.red,
                ),
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