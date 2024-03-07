import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/usage%20cubit/usage_cubit.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';
import 'package:z_flow1/features/home/presentation/widgets/usage_list_tile_subtitle.dart';
import 'package:z_flow1/features/home/presentation/widgets/usage_list_tile_title.dart';

class UsageTimeScreen extends StatefulWidget {
  const UsageTimeScreen({super.key});

  @override
  State<UsageTimeScreen> createState() => _UsageTimeScreenState();
}

class _UsageTimeScreenState extends State<UsageTimeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UsageCubit>().getInstalledUsedAppHelper();
  }

  @override
  Widget build(BuildContext context) {
    var usageCubit = context.read<UsageCubit>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildCustomAppBar(
          leading: Icons.arrow_back,
          onLeadingPressed: () => Navigator.pop(context),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              await usageCubit.getInstalledUsedAppHelper();
            },
            child: Column(
              children: [
                SizedBox(
                  height: 27.h,
                ),
                TitleTextWidget(
                  text: "وقت استخدام التطبيقات",
                  style: Styles.style16,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: BlocBuilder<UsageCubit, UsageState>(
                      builder: (context, state) {
                        return FutureBuilder(
                            future: usageCubit.getInstalledUsedAppHelper(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                for (var i = 0;
                                    i < usageCubit.infos.length;
                                    i++) {
                                  usageCubit.totalUsageTime =
                                      usageCubit.totalUsageTime +
                                          usageCubit.infos[i].usage.inSeconds;
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Card(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        color: Colorrs.kBlacklight1,
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12.w),
                                          leading: Container(
                                              width: 40.w,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child: Image.memory(
                                                snapshot.data![index].icon,
                                              )),
                                          title: UsageListTileTitle(
                                            infos: usageCubit.infos,
                                            snapshot: snapshot,
                                            index: index,
                                          ),
                                          subtitle: UsageListTileSubtitle(
                                            infos: usageCubit.infos,
                                            totalUsageTime:
                                                usageCubit.totalUsageTime,
                                            index: index,
                                          ),
                                        ));
                                  },
                                  itemCount: snapshot.data!.length,
                                );
                              } else if (snapshot.hasError) {
                                return const Text("Permissions!!");
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: Colorrs.kCyan,
                                ));
                              }
                            });
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
