import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20favourite%20cubit/get_favourite_cubit.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/task_item.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class FavouriteTasksScreen extends StatefulWidget {
  const FavouriteTasksScreen({super.key});

  @override
  State<FavouriteTasksScreen> createState() => _FavouriteTasksScreenState();
}

class _FavouriteTasksScreenState extends State<FavouriteTasksScreen> {
  @override
  void initState() {
    context.read<GetFavouriteCubit>().getFavouriteTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildCustomAppBar(
            leading: Icons.arrow_back,
            onLeadingPressed: () => Navigator.pop(context)),
        body: Column(children: [
          SizedBox(
            height: 24.h,
          ),
          TitleTextWidget(
            text: "مهام مفضلة",
            style: Styles.style16,
          ),
          SizedBox(
            height: 24.h,
          ),
          SvgPicture.asset(
            "assets/images/favourites.svg",
            height: 246.h,
          ),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
              builder: (context, state) {
                return ListView.builder(
                    itemCount: context
                        .read<GetFavouriteCubit>()
                        .favouriteTasksList
                        .length,
                    itemBuilder: (context, index) {
                      return TaskItem(
                          taskModel: context
                              .read<GetFavouriteCubit>()
                              .favouriteTasksList[index]);
                    });
              },
            ),
          )
        ]),
      ),
    );
  }
}
