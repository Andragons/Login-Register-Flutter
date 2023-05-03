import 'package:coba/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          RoundedElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String email = _emailController.text.trim();
                String password = _passwordController.text;
              }
            },
            title: 'Confirm',
            padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.38,
              vertical: Config.screenHeight! * 0.02,
            ),
          ),
          SizedBox(height: Config.screenHeight! * 0.01),
        ],
      ),
    );
  }
}
