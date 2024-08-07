import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_iti_app/user_handling/cubit/user_cubit.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/page_title.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/profile_avatar.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/submit_form_button.dart';
import 'package:shop_iti_app/user_handling/utils/fields_checks.dart';
import 'package:shop_iti_app/user_handling/utils/utils.dart';

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
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocListener<UserCubit, BaseUserState>(
        listener: userCubitListner,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _gkRegisterForm,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageTitle(
                      title: "Register",
                      subTitle: "Please register to login.",
                    ),
                    const SizedBox(height: 30,),
                    Center(
                      child: ProfileAvatar(
                        image:
                            _imagePath == null 
                              ? null 
                              : (_imagePath!.startsWith("https://") ? NetworkImage(_imagePath!) : AssetImage(_imagePath!)),
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
                      prefixIcon: const Icon(Icons.person),
                      validator: (v) => FieldCheck.name(v ?? ""),
                    ),
                    CustomTextFormField(
                      title: "Phone number",
                      controller: _phoneNumController,
                      prefixIcon: const Icon(Icons.phone),
                      validator: (v) => FieldCheck.phoneNum(v ?? ""),
                    ),
                    CustomTextFormField(
                      title: "Email Address",
                      controller: _emailController,
                      prefixIcon: const Icon(Icons.email),
                      validator: (v) => FieldCheck.email(v ?? ""),
                    ),
                    CustomTextFormField(
                      title: "Password",
                      controller: _passController,
                      prefixIcon: const Icon(Icons.lock),
                      isPassField: true,
                      validator: (v) => FieldCheck.password(v ?? ""),
                    ),
                    CustomTextFormField(
                      title: "Confirm password",
                      controller: _pass2Controller,
                      prefixIcon: const Icon(Icons.lock),
                      isPassField: true,
                      validator: (v) =>
                          _pass2Controller.text == _passController.text
                              ? null
                              : "Passwords do NOT match",
                    ),
                    const SizedBox(
                      height: 10,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
