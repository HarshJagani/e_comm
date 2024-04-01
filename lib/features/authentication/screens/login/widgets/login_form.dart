import 'package:e_comm_app/features/authentication/controllers/login_controller.dart';
import 'package:e_comm_app/features/authentication/screens/signup/fogot_password.dart';
import 'package:e_comm_app/features/authentication/screens/signup/sign_up.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:e_comm_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passwordHide = false;
  bool rememberme = true;

  @override
  Widget build(BuildContext context) {
    final dark = ECHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormkey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ECSize.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              validator: (value) => ECValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: ECText.email),
                  keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: ECSize.spaceBtwFields),

            //Password
            TextFormField(
              validator: (value) => ECValidator.validateEmptytext('Password',value),
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordHide = !passwordHide;
                    });
                  },
                  icon: Icon(passwordHide == false
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
                labelText: ECText.password,
              ),
              obscureText: passwordHide,
              keyboardType: TextInputType.visiblePassword,
            ),

            //Remember me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //Remember me
                Row(
                  children: [
                    Checkbox(value: rememberme, onChanged: (value) {
                      setState(() {
                        rememberme = value!;
                      });
                    }),
                    const Text(ECText.rememberme)
                  ],
                ),

                //Forgot Password
                TextButton(
                    onPressed: () {
                      Get.to(() => const ForgotPasswordScreen());
                    }, child: const Text(ECText.forgotpassword))
              ],
            ),
            SizedBox(
              height: ECSize.spaceBtwSections,
            ),

            //Signin button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                   controller.emailAndPasswordSignIn();
                  }, child: const Text(ECText.signin)),
            ),
            const SizedBox(height: ECSize.md),

            //Create account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                },
                child: Text(ECText.creataccount,
                    style:
                        TextStyle(color: dark ? Colors.white : Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
