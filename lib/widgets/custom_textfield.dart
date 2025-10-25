import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.label, this.textEditingController
  });
  final String label;
  final TextEditingController ? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: label,
        labelStyle: GoogleFonts.lato(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
