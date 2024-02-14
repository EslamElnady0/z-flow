import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20favourite%20cubit/get_favourite_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';
import 'package:z_flow1/features/home/presentation/screens/edit_habit_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_pop_up_menu_item.dart';

class HabitItem extends StatelessWidget {
  final HabitModel habitModel;
  const HabitItem({super.key, required this.habitModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          Container(
            padding: EdgeInsets.only(right: 8.w),
            width: 291.w,
            height: 54.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: [Constants.shadow],
            ),
            child: Center(
                child: Row(
              children: [
                Text(habitModel.title, style: Styles.style16),
                const Spacer(),
                PopupMenuButton(
                    splashRadius: 0.1,
                    offset: Offset(10.w, 10.h),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r)),
                    elevation: 5,
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            onTap: () {
                              habitModel.isFavourited =
                                  !habitModel.isFavourited;
                              habitModel.save();
                              context
                                  .read<GetFavouriteCubit>()
                                  .favouriteHabitsList
                                  .remove(habitModel);
                              context
                                  .read<GetFavouriteCubit>()
                                  .getFavouriteHabits();
                            },
                            child: CustomPopUpMenuItem(
                              title: "المفضلة",
                              icon: habitModel.isFavourited
                                  ? FontAwesomeIcons.solidStar
                                  : FontAwesomeIcons.star,
                            )),
                        PopupMenuItem(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EditHabitScreen(
                                          habitModel: habitModel)));
                            },
                            child: const CustomPopUpMenuItem(
                                title: "تعديل",
                                icon: FontAwesomeIcons.penToSquare)),
                        PopupMenuItem(
                            onTap: () {
                              habitModel.delete();
                              context
                                  .read<GetFavouriteCubit>()
                                  .favouriteHabitsList
                                  .remove(habitModel);
                              context.read<GetHabitCubit>().getHabits();

                              context
                                  .read<GetFavouriteCubit>()
                                  .getFavouriteHabits();
                            },
                            child: const CustomPopUpMenuItem(
                              title: "حذف",
                              icon: FontAwesomeIcons.trash,
                            )),
                      ];
                    })
              ],
            )),
          )
        ],
      ),
    );
  }
}
