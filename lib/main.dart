import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/features/layout/presentation/manager/layout_cubit/layout_screen_cubit.dart';
import 'package:shop_iti_app/features/layout/presentation/views/layout_view.dart';

void main() {
  DioApi.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutScreenCubit(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme:
              ColorScheme.fromSeed(seedColor: ConstantComponents.firstColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const LayoutView(),
      ),
    );
  }
}
