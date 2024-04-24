import 'package:e_comm_app/features/authentication/screens/login/widgets/form_divider.dart';
import 'package:e_comm_app/features/authentication/screens/login/widgets/login_footer.dart';
import 'package:e_comm_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ECSize.defaultSpace),
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ECText.signuptitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: ECSize.spaceBtwSections),

                  //Form
                  const SignUpForm(),

                  SizedBox(height: ECSize.spaceBtwSections),

                  const ECFormDivider(dividerText: ECText.orsignupwith),

                  SizedBox(height: ECSize.spaceBtwItems),

                  const LoginFooter()
                ],
              ),
            ),
          ),
        ));
  }
}
