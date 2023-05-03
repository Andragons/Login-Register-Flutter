// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// import 'package:coba/controller/authController.dart';
// import 'package:coba/screens/home/home.dart';
// import 'package:coba/screens/sign_in/sign_in.dart';

// import '../config.dart';

// class Root extends StatelessWidget {
//   const Root({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);

//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: GetBuilder<AuthController>(
//         builder: (_) {
//           return SafeArea(
//             child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: Config.screenWidth! * 0.04),
//                 child: _.isSignedIn.value ? Home() : SignIn()),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:coba/controller/authController.dart';
import 'package:coba/screens/home/home.dart';
import 'package:coba/screens/sign_in/sign_in.dart';

import '../config.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.04),
              child: _.userProfile != null ? const Home() : const SignIn(),
            ),
          );
        },
      ),
    );
  }
}
