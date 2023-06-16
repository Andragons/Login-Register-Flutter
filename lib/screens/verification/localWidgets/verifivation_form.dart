import 'package:coba/config.dart';
import 'package:coba/screens/verification/localWidgets/verification_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({Key? key}) : super(key: key);

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Form(
        child: Column(
          children: [
            OtpTextField(
              numberOfFields: 5,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
            ),
            // OTPTextField(
            //   length: 5,
            //   width: MediaQuery.of(context).size.width,
            //   fieldWidth: 40,
            //   style: TextStyle(fontSize: 17),
            //   textFieldAlignment: MainAxisAlignment.spaceAround,
            //   fieldStyle: FieldStyle.underline,
            //   onCompleted: (pin) {
            //     print("Completed: " + pin);
            //   },
            // ),
            SizedBox(
              height: Config.screenHeight! * 0.04,
            ),
            VerificationButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController),
          ],
        ),
      ),
    );
  }

  // Widget otp() {
  //   return Column(
  //     children: [

  //     ],
  //   );
  // }
}
