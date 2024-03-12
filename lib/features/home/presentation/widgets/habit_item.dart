import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/core/util/increament_method.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20favourite%20cubit/get_favourite_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';
import 'package:z_flow1/features/home/presentation/screens/habits%20screens/edit_habit_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_pop_up_menu_item.dart';
import 'package:z_flow1/features/home/presentation/widgets/cutom_checkbox.dart';
import 'package:z_flow1/features/home/presentation/widgets/show_animated_dialog.dart';

class HabitItem extends StatelessWidget {
  final HabitModel habitModel;
  const HabitItem({super.key, required this.habitModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          BlocBuilder<GetHabitCubit, GetHabitState>(builder: (context, state) {
            return CustomCheckBox(
              value: habitModel.isDone,
              onChanged: (value) {
                habitModel.isDone = !(habitModel.isDone);
                if (habitModel.isDone) {
                  context
                      .read<GetHabitCubit>()
                      .runningHabitsList
                      .remove(habitModel);
                  if (!habitModel.isDoneBefore) {
                    showAnimatedDialog(context);
                    incrementPoints();
                  }
                } else {
                  context
                      .read<GetHabitCubit>()
                      .completedHabitsList
                      .remove(habitModel);
                }
                habitModel.isDoneBefore = true;
                habitModel.save();

                context.read<GetHabitCubit>().getHabits();
              },
            );
          }),
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
                SizedBox(
                    width: 200.w,
                    child: Text(
                      habitModel.title,
                      style: Styles.style16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
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
                              context
                                  .read<GetHabitCubit>()
                                  .runningHabitsList
                                  .remove(habitModel);
                              context
                                  .read<GetHabitCubit>()
                                  .completedHabitsList
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
