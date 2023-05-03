import 'package:coba/widgets/hero_image.dart';
import 'package:coba/widgets/hero_title.dart';
import 'package:coba/screens/sign_in/localWidgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // shows header title
        HeroTitle(
          title: 'Welcome',
          subtitle: 'Enter email and password to login....',
        ),
        // shows hero image
        HeroImage(
          path: 'assets/loginHero.svg',
          semanticslabel: 'Login Hero',
        ),
        // shows textfields and buttons
        SignInForm(),
      ],
    );
  }
}
