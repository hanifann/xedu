import 'package:flutter/material.dart';
import 'package:xedu/themes/color.dart';

class CustomFormWidget extends StatelessWidget {
  const CustomFormWidget({
    Key? key, 
    required this.textEditingController, 
    this.isObscure = false, 
    required this.hintText,
    this.onSuffixTap,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.errorMessage
  }) : super(key: key);

  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;
  final VoidCallback? onSuffixTap;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String errorMessage;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isObscure,
      cursorColor: kPrimaryColor,
      keyboardType: keyboardType,
      validator: (value) {
        if(value == null || value.isEmpty){
          return errorMessage;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: onSuffixTap,
          child: Icon(
            suffixIcon,
            color: const Color.fromRGBO(120, 120, 120, 1),
            size: 24,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(120, 120, 120, 1),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Color.fromRGBO(120, 120, 120, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
        isDense: true,
      ),
    );
  }
}
