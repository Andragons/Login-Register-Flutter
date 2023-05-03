import 'package:coba/widgets/hero_image.dart';
import 'package:coba/widgets/hero_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'localWidgets/verifivation_form.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // shows header title
        HeroTitle(
          title: 'Verification',
          subtitle: 'Enter the verification code send at your email',
        ),
        // shows hero image
        HeroImage(
          path: 'assets/otp.svg',
          semanticslabel: 'Login Hero',
        ),
        // shows textfields and buttons for otp code
        VerificationForm(),
      ],
    );
  }
}
