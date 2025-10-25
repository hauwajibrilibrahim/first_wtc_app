import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key, this.textEditingController, this.label
  });
  final TextEditingController ? textEditingController;
  final label;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      obscureText: !isVisible,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: widget.label,
        labelStyle: GoogleFonts.lato(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: InkWell(
          onTap: (){
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Icon(isVisible? Icons.visibility : Icons.visibility_off),
        )
      ),
    );
  }
}
