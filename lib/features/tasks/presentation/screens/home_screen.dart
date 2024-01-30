import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow1/features/tasks/presentation/cubits/cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  static String pageName = 'homeScreen';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (context) => BottomNavBarCubit(),
          child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
            builder: (context, state) {
              return Scaffold(
                appBar: buildCustomAppBar(),
                bottomNavigationBar: CustomBottomNavBar(
                  ctx: context,
                ),
              );
            },
          ),
        ));
  }
}
