import 'package:e_comm_app/features/authentication/screens/login/login.dart';
import 'package:e_comm_app/features/authentication/screens/verify_email/success_screen.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ECSize.defaultSpace),
          child: Column(
            children: [
              //image
              Image.asset(
                ECImageString.verifyemail,
                width: ECHelperFunctions.screenWidth() * 0.6,
              ),

              SizedBox(height: ECSize.spaceBtwItems),

              //verified email address
              Text(ECText.verifyemailtitle,
                  style: Theme.of(context).textTheme.headlineMedium),

              SizedBox(height: ECSize.spaceBtwItems),

               Text(ECText.emapleemail,
                  style: Theme.of(context).textTheme.bodyMedium),

              SizedBox(height: ECSize.spaceBtwItems),    

              Text(
                ECText.verifyemailsubtitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: ECSize.spaceBtwItems),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const VerificationSuccess());
                    }, child: const Text(ECText.continuee)),
              ),

              const SizedBox(height: ECSize.xs),

              // resend code

              TextButton(onPressed: () {}, child: const Text(ECText.resendcode))
            ],
          ),
        ),
      ),
    );
  }
}
