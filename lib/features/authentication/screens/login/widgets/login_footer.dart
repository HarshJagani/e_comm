import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Image(
              height: ECSize.xl,
              width: ECSize.xl,
              fit: BoxFit.fitHeight,
              image: AssetImage(ECImageString.goggleLogo)),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Image(
              height: ECSize.xl,
              width: ECSize.xl,
              fit: BoxFit.cover,
              image: AssetImage(ECImageString.faceBookLogo)),
        ),
      ],
    );
  }
}
