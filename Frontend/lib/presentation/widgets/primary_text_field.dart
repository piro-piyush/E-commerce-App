import 'package:ecommerce/core/ui.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obsecureText;
  final String? Function(String?)? validator;

  const PrimaryTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.obsecureText = false,
    this.validator,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  late bool myObsecure;

  @override
  void initState() {
    super.initState();
    myObsecure = widget.obsecureText;
  }

  void toggleObsecureText() {
    setState(() {
      myObsecure = !myObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: myObsecure,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black),
        // Border when not focused
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey), // Grey color when not focused
          borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
        ),
        // Border when focused
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent), // Accent color when focused
          borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
        ),
        // Suffix icon for password visibility toggle
        suffixIcon: widget.obsecureText
            ? IconButton(
          icon: Icon(
            myObsecure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.accent,
          ),
          onPressed: toggleObsecureText,
        )
            : const SizedBox.shrink(),
      ),
      cursorColor: Colors.black,
    );
  }
}
