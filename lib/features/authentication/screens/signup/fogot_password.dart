import 'package:e_comm_app/features/authentication/screens/login/login.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding:  const EdgeInsets.all(ECSize.defaultSpace),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ECText.forgotpassword,style: Theme.of(context).textTheme.headlineMedium),
          
              const SizedBox(height: ECSize.defaultSpace),
          
              Text(ECText.forgotpasssubtitle, style: Theme.of(context).textTheme.bodyMedium),
          
              const SizedBox(height: ECSize.xl),
          
                TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: ECText.email),
                keyboardType: TextInputType.emailAddress,
              ),
          
              SizedBox(height: ECSize.spaceBtwSections),
          
               SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(ECText.signin)),
              ),
            ],
          ),
          onTap: () {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}