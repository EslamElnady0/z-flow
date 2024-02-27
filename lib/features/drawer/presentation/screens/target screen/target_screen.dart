import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20target%20cubit/get_target_cubit.dart';
import 'package:z_flow1/features/drawer/presentation/screens/target%20screen/add_target_screen.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/custom_add_button.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/target_item.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class TargetScreen extends StatelessWidget {
  const TargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: buildCustomAppBar(
              leading: Icons.arrow_back,
              onLeadingPressed: () => Navigator.pop(context)),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: BlocBuilder<GetTargetCubit, GetTargetState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    const TitleTextWidget(
                      text: "في هذه الصفحة يمكن تدوين أهدافك المستقبلية هنا !",
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Image.asset(
                      "assets/images/target image.png",
                      height: 272.h,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    if (context.read<GetTargetCubit>().targetsList.isNotEmpty)
                      Flexible(
                        child: ListView.builder(
                            itemCount: context
                                .read<GetTargetCubit>()
                                .targetsList
                                .length,
                            itemBuilder: (context, index) {
                              return TargetItem(
                                  targetModel: context
                                      .read<GetTargetCubit>()
                                      .targetsList[index]);
                            }),
                      ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomAddButton(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddTargetScreen())),
                      text: "إضافة هدف جديد",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
