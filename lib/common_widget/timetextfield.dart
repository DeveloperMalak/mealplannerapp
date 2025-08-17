import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/material.dart';

class Timetextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final double? height;
  final double? width;
  final VoidCallback  showtime;
  const Timetextfield({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.height,
    this.width,
  required   this.showtime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 90,
      child:
          VStack([
            TextFormField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              validator: validator,
              onChanged: onChanged,
readOnly: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () async{
                    showtime!();
                  },
                  icon: Icon(Icons.date_range_outlined),
                ),
                hintText: hintText,
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
              ),
            ),
          ]).py8(),
    );
  }
}
