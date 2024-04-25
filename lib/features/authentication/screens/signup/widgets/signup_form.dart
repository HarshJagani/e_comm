import 'package:e_comm_app/features/authentication/controllers/sign_up_controller.dart';
import 'package:e_comm_app/features/authentication/screens/signup/widgets/term_condition.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:e_comm_app/utils/validators/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool passwordHide = false;
  @override
  Widget build(BuildContext context) {
    final dark = ECHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupformkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                //First name
                child: TextFormField(
                  controller: controller.firstname,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outlined),
                      labelText: ECText.firstname),
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      ECValidator.validateEmptytext('First Name', value),
                ),
              ),
              SizedBox(width: ECSize.spaceBtwFields),
              Expanded(
                //Last name
                child: TextFormField(
                  controller: controller.lastname,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outlined),
                      labelText: ECText.lastname),
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      ECValidator.validateEmptytext('Last Name', value),
                ),
              ),
            ],
          ),

          SizedBox(height: ECSize.spaceBtwFields),

          //Username
          TextFormField(
            controller: controller.username,
            decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                labelText: ECText.username),
            keyboardType: TextInputType.name,
            validator: (value) =>
                ECValidator.validateEmptytext('User Nmae', value),
          ),
          SizedBox(height: ECSize.spaceBtwFields),

          //Email
          TextFormField(
            controller: controller.email,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: ECText.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => ECValidator.validateEmail(value),
          ),
          SizedBox(height: ECSize.spaceBtwFields),

          //Phone number
          TextFormField(
            controller: controller.phonenumber,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.call_outlined),
                labelText: ECText.phonenuber),
            keyboardType: TextInputType.number,
            validator: (value) => ECValidator.validatenumber(value),
          ),
          SizedBox(height: ECSize.spaceBtwFields),

          //Password
          TextFormField(
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
            validator: (value) => ECValidator.validatePassword(value!),
          ),

          SizedBox(height: ECSize.spaceBtwSections),

          //Privacy policy and terms
          TermsCondition(dark: dark),

          SizedBox(height: ECSize.spaceBtwSections),

          //Create acc. button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(ECText.creataccount)),
          ),
        ],
      ),
    );
  }
}
