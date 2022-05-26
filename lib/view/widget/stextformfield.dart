import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final bool obscure;
  final bool align;
  final String? initialValue;
  final int? max;
  final Color fillcolor;
  final bool enabled;
  final int? min;
  final int? maxlenth;
  final String? Function(String?)? validator;
  final String? hint;
  final String? lable;
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
      required this.hint,
      this.max = 1,
      this.min,
      this.obscure = false,
      this.onedit,
      this.suffix,
      this.type,
      required this.validator,
      this.visiblpass,
      Key? key,
      this.lable,
      this.fillcolor = Colors.white,
      this.enabled = true,
      this.maxlenth})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      maxLength: widget.maxlenth,
      onTap: widget.onedit,
      textInputAction: widget.action,
      maxLines: widget.max,
      minLines: widget.min,
      initialValue: widget.initialValue,
      controller: widget.controller,
      style: const TextStyle(color: txtcolor),
      cursorColor: maincolor,
      keyboardType: widget.type,
      obscureText: widget.obscure,
      validator: widget.validator,
      decoration: InputDecoration(
          counterStyle: const TextStyle(color: txtcolor),
          fillColor: widget.fillcolor,
          filled: true,
          alignLabelWithHint: widget.align,
          suffixIcon: IconButton(
            icon: Icon(
              widget.suffix,
              color: Colors.grey,
            ),
            onPressed: widget.visiblpass,
          ),
          labelText: widget.lable,
          hintText: widget.hint,
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
