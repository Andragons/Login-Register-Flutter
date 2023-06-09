import 'package:coba/controller/authController.dart';
import 'package:coba/screens/root.dart';
import 'package:coba/screens/verification/verification.dart';
import 'package:coba/widgets/rounded_elevated_button.dart';
import 'package:coba/widgets/text_with_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../config.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Expanded(
      flex: 4,
      child: Column(
        children: [
          RoundedElevatedButton(
            onPressed: () => Get.off(Verification()),
            // {
            //   if (_formKey.currentState!.validate()) {
            //     String name = _nameController.text.trim();
            //     String email = _emailController.text.trim();
            //     String password = _passwordController.text;

            //     _authController.signUp(name, email, password);
            //   }
            // },
            title: 'Sign Up',
            padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.38,
              vertical: Config.screenHeight! * 0.02,
            ),
          ),
          TextWithTextButton(
            text: 'Already have an account?',
            textButtonText: 'Sign In',
            onPressed: () => Get.offAll(
              () => Root(),
            ),
          ),
        ],
      ),
    );
  }
}
