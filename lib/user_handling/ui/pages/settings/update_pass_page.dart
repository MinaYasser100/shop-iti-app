
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/user_handling/cubit/user_cubit.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/custom_text_field.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/submit_form_button.dart';
import 'package:shop_iti_app/user_handling/utils/fields_checks.dart';
import 'package:shop_iti_app/user_handling/utils/utils.dart';


final _gkUpdatePasswordForm = GlobalKey<FormState>();
class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}
class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final _currentPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _confirmNewPassController = TextEditingController();

  @override
  void dispose() {
    _currentPassController.dispose();
    _newPassController.dispose();
    _confirmNewPassController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocListener<UserCubit, BaseUserState>(
        listener: userCubitListner,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _gkUpdatePasswordForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  title: "Current password",
                  controller: _currentPassController,
                  prefixIcon: const Icon(Icons.lock),
                  isPassField: true,
                  validator: (v) => FieldCheck.password(v ?? ""),
                ),
                CustomTextFormField(
                  title: "New password",
                  controller: _newPassController,
                  prefixIcon: const Icon(Icons.lock),
                  isPassField: true,
                  validator: (v) => FieldCheck.password(v ?? ""),
                ),
                CustomTextFormField(
                  title: "Confirm new password",
                  controller: _confirmNewPassController,
                  prefixIcon: const Icon(Icons.lock),
                  isPassField: true,
                  validator: (v) =>
                      _newPassController.text == _confirmNewPassController.text
                          ? null
                          : "Passwords do NOT match",
                ),
                const Spacer(),
                SubmitFormButton(
                  title: "Update",
                  onTap: () {
                    if (_gkUpdatePasswordForm.currentState?.validate() ??
                        false) {
                      context.read<UserCubit>().changePassword(
                            currentPassword: _currentPassController.text,
                            newPassword: _newPassController.text,
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
