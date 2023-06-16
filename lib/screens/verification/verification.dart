import 'package:coba/screens/verification/localWidgets/verifivation_form.dart';
import 'package:coba/widgets/hero_image.dart';
import 'package:flutter/material.dart';
import 'package:coba/widgets/hero_title.dart';
import 'package:coba/widgets/rounded_text_formfield.dart';

import '../../config.dart';
// import 'localWidgets/sign_up_buttons.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.04),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                HeroTitle(
                  title: 'Verifikasi',
                  subtitle: 'Create an account...',
                ),
                HeroImage(path: 'assets/otp.svg', semanticslabel: 'OTP'),
                VerificationForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
