import 'package:flutter/material.dart';
import 'package:shop_iti_app/login_register/models/request_models.dart';
import 'package:shop_iti_app/login_register/ui/widgets/submit_form_button.dart';
import 'package:shop_iti_app/login_register/utils/fields_checks.dart';

import '../../../core/constant/constant.dart';
import '../widgets/custom_text_field.dart';

final _gkLoginForm = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login", 
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _gkLoginForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  title: "Email Address",
                  validator: (v) => FieldCheck.email(v ?? "")
                    ? null
                    : "Enter a correct email",
                ),
                const SizedBox(height: 20,),
                CustomTextFormField(
                  title: "Password",
                  isPassField: true,
                  validator: (v) => FieldCheck.password(v ?? "")
                    ? null
                    : "Enter a password",
                ),
                const SizedBox(height: 20,),
                Center(child: _rememberMeAndForgetPass()),
                const SizedBox(height: 30,),
                SubmitFormButton(
                  title: "Login",
                  onTap: () => _gkLoginForm.currentState?.validate(),
                ),
                if(false) SizedBox( // TODO
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){}, 
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(child: _registerQuestion())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerQuestion() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text("Don`t have an account?"),
      const SizedBox(width: 2,),
      TextButton(
        onPressed: (){},
        child: const Text(
          "Register", 
          style: TextStyle(color: ConstantComponents.firstColor,),
        ),
      ),
    ],
  );

  Widget _rememberMeAndForgetPass() => Transform.translate(
    offset: const Offset(-10, 0),
    child: Row(
      children: [
        InkWell(
          onTap: () => setState(() => _rememberMe = !_rememberMe),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IgnorePointer(
                  child: Checkbox(
                    value: _rememberMe, 
                    onChanged: (_){},
                  ),
                ),
                const Text("Remember me"),
              ],
            ),
          ),
        ),
        const Spacer(),
        if(false) Transform.translate(
          offset: const Offset(15, 0),
          child: TextButton(
            onPressed: (){},
            child: const Text(
              "Forget Password!", 
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  );
}