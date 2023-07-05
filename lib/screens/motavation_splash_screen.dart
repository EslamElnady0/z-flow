import 'package:flutter/material.dart';
import 'package:z_flow1/constants.dart';
import 'package:z_flow1/screens/tasks_screen.dart';
import 'package:z_flow1/util/context_helpers.dart';

class MotivationScreen extends StatefulWidget {
  static String pageName = 'motivateScreen';
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 3)).then((_) {
  //     Navigator.pushReplacementNamed(context,TasksScreen.pageName );
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.width*0.672,
              width: context.width*0.672,
                child: Image.asset("assets/images/motivate.gif")),
            SizedBox(
              height: context.height * 0.0455665024630542,
            ),
            const Text("! استمر ",style: TextStyle(fontSize: 30,color: kGreenyCyan),),
            const Text("انت شخص رائع",style: TextStyle(fontSize: 30,color: kGreenyCyan),),
          ],
        ),
      ),
    );
  }
}
