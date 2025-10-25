import 'dart:async';
import 'package:first_app/widgets/custom_button.dart';
import 'package:first_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_input/otp_input.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool showOtp = false;
  late Timer timer;
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter the email address you would like to recieve your recovery pin',
            style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          CustomTextField(label: 'Email Address'),
          showOtp
              ? _buildOtpView()
              : CustomButton(
                  text: 'Get OTP',
                  onPressed: () {
                    setState(() {
                      showOtp = true;
                    });
                    //set request otp timer
                    timer = Timer.periodic(Duration(seconds: 1), (timer) {
                      print('Ticked');
                      if (seconds <= 1) {
                        timer.cancel();
                      }
                      setState(() {
                        seconds--;
                      });
                    });
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildOtpView() {
    return Column(
      spacing: 8,
      children: [
        Text(
          'Check your email and enter the OTP you recieved',
          style: GoogleFonts.lato(fontSize: 16, color: Colors.grey),
        ),
        OtpInputField(
          otpInputFieldCount: 6,
          fieldStyle: OtpFieldStyle.circle,
          fieldHeight: 50,
          fieldWidth: 50,
          onOtpEntered: (otp) {
            print('Entered OTP: $otp');
            if (otp == '246810') {
              Navigator.of(context).pushNamed('/home');
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Invalid OTP')));
            }
          },
        ),
        Text('$seconds seconds to request again!'),
      ],
    );
  }
}
