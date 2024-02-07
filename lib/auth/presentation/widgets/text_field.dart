import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  final Function(String)? onChange;
  final Function()? onTapSuffix;
  final MaskTextInputFormatter? formatter;

  const CustomTextField(
      {
        super.key,
        required this.label,
        required this.hint,
        required this.controller,
        this.isObscure = false,
        this.onTapSuffix,
        this.formatter,
        this.onChange
      }
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 167, 167,167),
            fontFamily: 'Roboto'
          )
        ),
        const SizedBox(height: 8),
        TextField(
          inputFormatters: (formatter != null) ? [formatter!] : [],
          obscureText: isObscure,
          style: Theme.of(context).textTheme.labelMedium,
          obscuringCharacter: "*",
          controller: controller,

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 207, 207, 207)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  width: 4,
                  style: BorderStyle.none,
                  color: Color.fromARGB(255, 167, 167, 167)
              ),
            ),
            suffixIcon: (onTapSuffix != null)
                ? GestureDetector(
              onTap: onTapSuffix,
              child: Image.asset("assets/eye-slash.png"),
            )
                : null,
          ),
        ),
      ],
    );
  }
}