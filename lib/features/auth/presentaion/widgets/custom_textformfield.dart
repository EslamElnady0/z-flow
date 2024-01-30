import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final String hint;
  IconData? suffixIcon;
  final IconData prefixIcon;
   VoidCallback? onTap;
  final bool isPassword;
  final TextInputType? keyboardType;
  String? Function(String?)? validate;
   AutovalidateMode? autoValidateMode=AutovalidateMode.disabled;


   CustomTextFormField({
      this.autoValidateMode,
     required this.keyboardType,
       this.validate,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    required this.isPassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode:autoValidateMode,
      cursorColor: Colors.white,

      style: const TextStyle(color: Colors.white),
      validator: validate,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
       contentPadding:const EdgeInsets.symmetric(vertical: 10),
        suffixIcon: IconButton(onPressed:onTap,icon: Icon(suffixIcon),color: Colors.grey.shade400,),
        prefixIcon: Icon(
         prefixIcon,
          color: Colors.grey.shade400,
        ),
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white,width: 2)) ,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white,width: 2)),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white,width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red,width: 2)),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }
}
