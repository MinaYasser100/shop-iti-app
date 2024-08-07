import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/user_handling/cubit/user_cubit.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/animated_edit_button.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/custom_text_field.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/profile_avatar.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/submit_form_button.dart';
import 'package:shop_iti_app/user_handling/utils/fields_checks.dart';
import 'package:shop_iti_app/user_handling/utils/utils.dart';

final _gkProfileDataForm = GlobalKey<FormState>();

class ProfileDataPage extends StatefulWidget {
  const ProfileDataPage({super.key});

  @override
  State<ProfileDataPage> createState() => _ProfileDataPageState();
}

class _ProfileDataPageState extends State<ProfileDataPage> {
  final _nameController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _emailController = TextEditingController();
  String? _imagePath;

  bool get _updateMode {
    final state = context.read<UserCubit>().state;
    if(state is InUpdateProfilePageState){
      return state.updateMode;
    }else{
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    _updateFromCubit(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  void _onEditProfileAvatar() async {
    final picker = ImagePicker();
    final image =
        await picker.pickImage(source: ImageSource.gallery);
        
    if (image != null) {
      _imagePath = image.path;
      setState(() {});
    }
  }

  void _updateFromCubit(BuildContext context){
    final state = context.read<UserCubit>().state;
    if(state is InUpdateProfilePageState){
      _nameController.text = state.user.name;
      _phoneNumController.text = state.user.phoneNum;
      _emailController.text = state.user.email;
      _imagePath = state.user.imageUrl;
      setState(() {});
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop){
        if(didPop){
          context.read<UserCubit>().backToSettingsPage();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: BlocListener<UserCubit, BaseUserState>(
          listener: (context, state) {
            userCubitListner(context, state);
            _updateFromCubit(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _gkProfileDataForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileAvatar(
                    image: _imagePath == null 
                      ? null 
                      : (_imagePath!.startsWith("https://") ? NetworkImage(_imagePath!) : AssetImage(_imagePath!)),
                    onTap: !_updateMode ? null : _onEditProfileAvatar,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    title: "Name",
                    controller: _nameController,
                    prefixIcon: const Icon(Icons.person),
                    validator: (v) => FieldCheck.name(v ?? "")
                        ? null
                        : "Enter a correct name",
                    readOnly: !_updateMode,
                  ),
                  CustomTextFormField(
                    title: "Phone number",
                    controller: _phoneNumController,
                    prefixIcon: const Icon(Icons.phone),
                    validator: (v) => FieldCheck.phoneNum(v ?? "")
                        ? null
                        : "Enter a correct phone number",
                    readOnly: !_updateMode,
                  ),
                  CustomTextFormField(
                    title: "Email Address",
                    controller: _emailController,
                    prefixIcon: const Icon(Icons.email),
                    validator: (v) => FieldCheck.email(v ?? "")
                        ? null
                        : "Enter a correct email",
                    readOnly: !_updateMode,
                  ),
                  const Spacer(),
                  AnimatedEditButton(
                    editClicked: _updateMode,
                    onEdit: () => context.read<UserCubit>().changeUpdateProfileMode(true),
                    onSave: (){
                      if (_gkProfileDataForm.currentState?.validate() ?? false) {
                        context.read<UserCubit>().updateProfile(
                          name: _nameController.text, 
                          email: _emailController.text, 
                          phoneNum: _phoneNumController.text, 
                          imagePath: _imagePath,
                        );
                        _gkProfileDataForm.currentState?.reset();
                      }
                    },
                    onCancel: () {
                      context.read<UserCubit>().changeUpdateProfileMode(false);
                      _gkProfileDataForm.currentState?.reset();
                    },
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