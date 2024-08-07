import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/user_handling/cubit/user_cubit.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/page_title.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/submit_form_button.dart';
import 'package:shop_iti_app/user_handling/utils/fields_checks.dart';
import 'package:shop_iti_app/user_handling/utils/utils.dart';

import '../../../core/constant/constant.dart';
import '../widgets/custom_text_field.dart';

final _gkLoginForm = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _rememberMe = false;
  TextDecoration? _registerDecoration;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserCubit, BaseUserState>(
        listener: userCubitListner,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _gkLoginForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PageTitle(
                    title: "Login",
                    subTitle: "Please login to continue.",
                  ),
                  const SizedBox(height: 30,),
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
                  Center(child: _rememberMeAndForgetPass()),
                  const SizedBox(height: 20,),
                  SubmitFormButton(
                    title: "Login",
                    onTap: (){
                      if(_gkLoginForm.currentState?.validate() ?? false){
                        context.read<UserCubit>().login(
                          email: _emailController.text, 
                          password: _passController.text, 
                          rememberMe: _rememberMe,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  Center(child: _registerQuestion())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerQuestion() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        "Don`t have account?",
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      const SizedBox(width: 6,),
      InkWell(
        onTap: () => context.read<UserCubit>().toRegisterPage(),
        onHover: (h) => setState(() => _registerDecoration = h ? TextDecoration.underline : null),
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Text(
          "Register", 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ConstantComponents.firstColor,
            decoration: _registerDecoration,
          ),
        ),
      ),
    ],
  );

  Widget _rememberMeAndForgetPass() => InkWell(
    onTap: () => setState(() => _rememberMe = !_rememberMe,),
    borderRadius: BorderRadius.circular(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Remember me",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IgnorePointer(
          child: Transform.scale(
            scale: 0.75,
            child: Switch(
              value: _rememberMe, 
              onChanged: (_){},
            ),
          ),
        ),
      ],
    ),
  );
}