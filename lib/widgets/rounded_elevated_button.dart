// import 'package:flutter/material.dart';

// import '../config.dart';

// class RoundedElevatedButton extends StatelessWidget {
//   const RoundedElevatedButton({
//     Key? key,
//     @required this.title,
//     @required this.onPressed,
//     @required this.padding,
//   }) : super(key: key);

//   final String? title;
//   final onPressed, padding;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => print('Sign In'),
//       child: Text(title!),
//       style: ElevatedButton.styleFrom(
//         padding: padding,
//         primary: kPrimaryColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../config.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton({
    Key? key,
    @required this.title,
    @required this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final String? title;
  final onPressed, padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title!,
        style: TextStyle(fontSize: Config.screenWidth! * 0.04),
      ),
      style: ElevatedButton.styleFrom(
        padding: padding,
        primary: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
