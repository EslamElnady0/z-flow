import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:z_flow1/features/home/presentation/screens/account_screen.dart';
import 'package:z_flow1/features/home/presentation/screens/date_screen.dart';
import 'package:z_flow1/features/home/presentation/screens/habits_screen.dart';
import 'package:z_flow1/features/home/presentation/screens/tasks_screen.dart';
import 'package:z_flow1/features/home/presentation/screens/usage_screen.dart';
import 'package:z_flow1/features/home/presentation/ui%20cubits/cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static String pageName = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

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
                key: _scaffoldKey,
                drawer: const CustomDrawer(),
                appBar: buildCustomAppBar(actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/search.svg",
                      height: 24.r,
                    ),
                  ),
                ], onLeadingPressed: openDrawer, leading: Icons.menu),
                body: switch (context.read<BottomNavBarCubit>().index) {
                  0 => const TasksScreen(),
                  1 => const DateScreen(),
                  2 => const UsageScreen(),
                  3 => const HabitsScreen(),
                  4 => const AccountScreen(),
                  _ => const Placeholder(),
                },
                bottomNavigationBar: CustomBottomNavBar(
                  ctx: context,
                ),
              );
            },
          ),
        ));
  }
}
