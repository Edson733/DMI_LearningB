import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  const CustomTextFieldPassword({super.key, required this.controller, this.hintText = 'Contraseña', this.labelText = 'Contraseña'});

  @override
  State<CustomTextFieldPassword> createState() => _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: const TextStyle(fontSize: 16, color: Colors.white38),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}