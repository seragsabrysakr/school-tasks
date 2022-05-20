import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final bool obscure;
  final bool align;
  final String? initialValue;
  final int? max;
  final int? min;
  final String? Function(String?)? validator;
  final String? label;
  final TextEditingController? controller;
  final IconData? suffix;
  final TextInputType? type;
  final VoidCallback? visiblpass;
  final VoidCallback? onedit;
  final FocusNode focusNode;
  final TextInputAction? action;
  const CustomTextField(
      {required this.controller,
      this.align = false,
      this.action,
      this.initialValue,
      required this.focusNode,
      required this.label,
      this.max = 1,
      this.min,
      this.obscure = false,
      this.onedit,
      this.suffix,
      this.type,
      required this.validator,
      this.visiblpass,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onedit,
      textInputAction: action,
      maxLines: max,
      minLines: min,
      initialValue: initialValue,
      controller: controller,
      style: const TextStyle(color: txtcolor),
      cursorColor: maincolor,
      keyboardType: type,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          alignLabelWithHint: align,
          suffixIcon: IconButton(
            icon: Icon(
              suffix,
              color: Colors.grey,
            ),
            onPressed: visiblpass,
          ),
          hintText: label,
          hintStyle: const TextStyle(color: txtcolor),
          // floatingLabelStyle: ,
          // contentPadding: EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: maincolor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: maincolor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: maincolor, width: 2)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          )),
    );
  }
}
