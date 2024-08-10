
import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/submit_form_button.dart';

class AnimatedEditButton extends StatelessWidget {
  final bool editClicked;
  final void Function() onEdit;
  final void Function() onSave;
  final void Function() onCancel;
  const AnimatedEditButton({
    super.key,
    required this.editClicked,
    required this.onEdit,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) => Stack(
      children: [
        IgnorePointer(
          ignoring: !editClicked,
          child: Align(
            alignment: Alignment.centerLeft,
            child: SubmitFormButton(
              title: editClicked ? "Cancel" : "Edit",
              bgColor: editClicked
                  ? Colors.redAccent
                  : ConstantComponents.firstColor,
              width: editClicked ? c.maxWidth * 0.325 : c.maxWidth,
              onTap: () {
                if (editClicked) {
                  onCancel();
                }
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SubmitFormButton(
            title: editClicked ? "Save" : "Edit",
            bgColor: ConstantComponents.firstColor,
            width: editClicked ? c.maxWidth * 0.625 : c.maxWidth,
            onTap: () {
              if (editClicked) {
                onSave();
              } else {
                onEdit();
              }
            },
          ),
        ),
      ],
    ),
  );
}
