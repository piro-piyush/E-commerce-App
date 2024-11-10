import 'package:ecommerce/core/ui.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obsecureText;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Function(String)? onChanged;
  final String? Function(String?)? onSubmitted;
  final FocusNode? focusNode;

  const PrimaryTextField({
    super.key,
    this.initialValue,
    required this.labelText,
    this.controller,
    this.onSubmitted,
    this.obsecureText = false,
    this.validator, this.focusNode, this.onChanged,
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
      validator: widget.validator,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode ?? FocusNode(),
      onFieldSubmitted:widget.onSubmitted,
      onChanged: widget.onChanged,
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
