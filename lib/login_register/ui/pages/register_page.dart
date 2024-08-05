import 'package:flutter/material.dart';
import 'package:shop_iti_app/login_register/ui/widgets/profile_avatar.dart';
import 'package:shop_iti_app/login_register/ui/widgets/submit_form_button.dart';
import 'package:shop_iti_app/login_register/utils/fields_checks.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _gkRegisterForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ProfileAvatar(
                  image: AssetImage("images/"),
                ),
              ),
              const SizedBox(height: 15,),
              CustomTextFormField(
                title: "Name",
                controller: _nameController,
                validator: (v) => FieldCheck.name(v ?? "")
                  ? null
                  : "Enter a correct name",
              ),
              const SizedBox(height: 20,),
              CustomTextFormField(
                title: "Phone number",
                controller: _phoneNumController,
                validator: (v) => FieldCheck.phoneNum(v ?? "")
                  ? null
                  : "Enter a correct phone number",
              ),
              const SizedBox(height: 20,),
              CustomTextFormField(
                title: "Email Address",
                controller: _emailController,
                validator: (v) => FieldCheck.email(v ?? "")
                  ? null
                  : "Enter a correct email",
              ),
              const SizedBox(height: 20,),
              CustomTextFormField(
                title: "Password",
                controller: _passController,
                isPassField: true,
                validator: (v) => FieldCheck.password(v ?? "")
                  ? null
                  : "Enter a password",
              ),
              const SizedBox(height: 20,),
              CustomTextFormField(
                title: "Confirm password",
                controller: _pass2Controller,
                isPassField: true,
                validator: (v) => _pass2Controller.text == _passController.text
                  ? null
                  : "Passwords do NOT match",
              ),
              const SizedBox(height: 20,),
              SubmitFormButton(
                title: "Register",
                onTap: (){
                  _gkRegisterForm.currentState?.validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}