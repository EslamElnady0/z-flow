import 'package:flutter/material.dart';



class AuthBottomButtonForward extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const AuthBottomButtonForward({super.key, required this.title,required this.icon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const  EdgeInsets.only(right: 10,bottom: 15),

    child:GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  [
          Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white,fontSize: 16),
            ),
          ),
          Icon(icon,color: Colors.white,size: 27,)
        ],
      ),
    ));
  }
}

class AuthBottomButtonBackwards extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const AuthBottomButtonBackwards({super.key, required this.title,required this.icon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const  EdgeInsets.only(left: 10,bottom: 15),

    child: GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  [
          Icon(icon,color: Colors.white,size: 27,),
          Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white,fontSize: 16),
            ),
          ),

        ],
      ),
    ));
  }
}
