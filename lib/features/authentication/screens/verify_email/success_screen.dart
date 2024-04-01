import 'package:e_comm_app/features/authentication/screens/login/login.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationSuccess extends StatelessWidget {
  const VerificationSuccess({super.key});

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
                ECImageString.done,
                width: ECHelperFunctions.screenWidth() * 0.6,
              ),

              SizedBox(height: ECSize.spaceBtwItems),

              //verified email address
              Text(ECText.verificationdone,
                  style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),

              SizedBox(height: ECSize.spaceBtwItems),

               
              Text(
                ECText.verifyemailsubtitle2,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: ECSize.spaceBtwItems),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(ECText.continuee)),
              ),

           
            ],
          ),
        ),
      ),
    );
  }
}
