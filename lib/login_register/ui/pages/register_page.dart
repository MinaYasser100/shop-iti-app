import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_iti_app/login_register/cubit/login_register_cubit.dart';
import 'package:shop_iti_app/login_register/cubit/state/login_register_states.dart';
import 'package:shop_iti_app/login_register/ui/widgets/profile_avatar.dart';
import 'package:shop_iti_app/login_register/ui/widgets/submit_form_button.dart';
import 'package:shop_iti_app/login_register/utils/fields_checks.dart';
import 'package:shop_iti_app/login_register/utils/utils.dart';

import '../widgets/custom_text_field.dart';

final _gkRegisterForm = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _pass2Controller = TextEditingController();

  String? _imagePath;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _pass2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocListener<UserCubit, BaseLogRegState>(
        listener: userCubitListner,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _gkRegisterForm,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ProfileAvatar(
                      image:
                          _imagePath == null ? null : AssetImage(_imagePath!),
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final image =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (image != null) {
                          _imagePath = image.path;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    title: "Name",
                    controller: _nameController,
                    validator: (v) => FieldCheck.name(v ?? "")
                        ? null
                        : "Enter a correct name",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    title: "Phone number",
                    controller: _phoneNumController,
                    validator: (v) => FieldCheck.phoneNum(v ?? "")
                        ? null
                        : "Enter a correct phone number",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    title: "Email Address",
                    controller: _emailController,
                    validator: (v) => FieldCheck.email(v ?? "")
                        ? null
                        : "Enter a correct email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    title: "Password",
                    controller: _passController,
                    isPassField: true,
                    validator: (v) => FieldCheck.password(v ?? "")
                        ? null
                        : "Enter a password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    title: "Confirm password",
                    controller: _pass2Controller,
                    isPassField: true,
                    validator: (v) =>
                        _pass2Controller.text == _passController.text
                            ? null
                            : "Passwords do NOT match",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubmitFormButton(
                    title: "Register",
                    onTap: () {
                      if (_gkRegisterForm.currentState?.validate() ?? false) {
                        context.read<UserCubit>().register(
                              name: _nameController.text,
                              phoneNum: _phoneNumController.text,
                              email: _emailController.text,
                              password: _passController.text,
                              imagePath: _imagePath,
                            );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
