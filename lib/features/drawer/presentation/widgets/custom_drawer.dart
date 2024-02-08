import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
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
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Constants.drawerScreens[index]));
                        },
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
