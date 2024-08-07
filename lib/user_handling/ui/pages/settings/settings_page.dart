import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/pages/get_pages.dart';
import 'package:shop_iti_app/features/layout/presentation/manager/layout_cubit/layout_screen_cubit.dart';
import 'package:shop_iti_app/user_handling/cubit/user_cubit.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/profile_avatar.dart';
import 'package:shop_iti_app/user_handling/ui/widgets/submit_form_button.dart';
import 'package:shop_iti_app/user_handling/utils/utils.dart';

const _listTileShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _avatarAndName(),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: ListView(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.person_2_outlined),
                      title: const Text("Personal Information"),
                      trailing: const Icon(Icons.navigate_next),
                      shape: _listTileShape,
                      onTap: () =>
                          context.read<UserCubit>().toUpdateProfilePage(),
                    ),
                    const Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.password_outlined),
                      title: const Text("Update Password"),
                      trailing: const Icon(Icons.navigate_next),
                      shape: _listTileShape,
                      onTap: () => Get.toNamed(GetPages.kUpdatePasswordView),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SubmitFormButton(
                  title: "Logout",
                  bgColor: Colors.red,
                  onTap: () {
                    context.read<UserCubit>().logout();
                    context.read<LayoutScreenCubit>().currentIndex = 0;
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarAndName() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<UserCubit, BaseUserState>(
              buildWhen: (previous, current) =>
                  current is LoggedInState &&
                  previous is LoggedInState &&
                  current.user.imageUrl != previous.user.imageUrl,
              builder: (context, state) => ProfileAvatar(
                image: state is! LoggedInState
                    ? null
                    : NetworkImage(state.user.imageUrl),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<UserCubit, BaseUserState>(
              buildWhen: (previous, current) =>
                  current is LoggedInState &&
                  previous is LoggedInState &&
                  current.user.name != previous.user.name,
              builder: (context, state) => state is! LoggedInState
                  ? const SizedBox.shrink()
                  : Text(
                      state.user.name,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
