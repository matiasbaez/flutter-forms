
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final bool? obscureText;
  final bool? isRequired;
  final String? hintText;
  final Icon? prefixIcon;
  final String? errorText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.hintText = '',
    this.isRequired = false,
    this.obscureText = false,
    this.prefixIcon,
    this.errorText,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final inputBorder = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(30)
    );

    return TextFormField(
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator ?? (value) {

        if (isRequired != null) {
          if (value == null) return 'Required field';
          if (value.isEmpty) return 'Required field';
          if (value.trim().isEmpty) return 'Required field';
        }

        return null;
      },
      decoration: InputDecoration(

        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(borderSide: BorderSide( color: colors.primary ) ),
        errorBorder: inputBorder.copyWith(borderSide: BorderSide( color: Colors.red.shade800 ) ),
        focusedErrorBorder: inputBorder.copyWith(borderSide: BorderSide( color: Colors.red.shade800 ) ),

        isDense: true, // Make the input more compact
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        focusColor: colors.primary,
        prefixIcon: prefixIcon ?? Icon( Icons.supervised_user_circle_outlined, color: colors.primary ),
        errorText: errorText

      ),
    );

  }
}