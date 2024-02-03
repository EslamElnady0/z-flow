import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/tasks/presentation/cubits/cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow1/features/tasks/presentation/screens/account_screen.dart';
import 'package:z_flow1/features/tasks/presentation/screens/date_screen.dart';
import 'package:z_flow1/features/tasks/presentation/screens/habits_screen.dart';
import 'package:z_flow1/features/tasks/presentation/screens/tasks_screen.dart';
import 'package:z_flow1/features/tasks/presentation/screens/usage_screen.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  static String pageName = 'homeScreen';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                drawer: const DrawerWidget(),
                appBar: buildCustomAppBar(onMenuPressed: openDrawer),
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

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.w,
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
            gradient: Constants.zFlowGradient, borderRadius: BorderRadius.zero),
        child: Column(
          children: [
            SizedBox(
              height: 62.h,
            ),
            Image.asset("assets/images/11 1.png"),
            Image.asset(
              "assets/images/Z-Flow.png",
              height: 26.h,
              width: 84.w,
            ),
            SizedBox(
              height: 18.h,
            ),
            const Divider(
              color: Colorrs.kWhite,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: Constants.drawerItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                          Constants.drawerItems[index]["title"]!,
                          style: Styles.style16.copyWith(color: Colors.white),
                        ),
                        trailing: FaIcon(
                          Constants.drawerItems[index]["icon"]!,
                          color: Colors.white,
                          size: 20.r,
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
