import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBottomButtonForward extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const AuthBottomButtonForward(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 10.w, bottom: 15.h),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 27.r,
              )
            ],
          ),
        ));
  }
}

class AuthBottomButtonBackwards extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const AuthBottomButtonBackwards(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.w, bottom: 15.h),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 27.r,
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ));
  }
}
