import 'package:e_comm_app/common/styles/spacing_style.dart';
import 'package:e_comm_app/features/authentication/screens/login/widgets/form_divider.dart';
import 'package:e_comm_app/features/authentication/screens/login/widgets/login_footer.dart';
import 'package:e_comm_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_comm_app/features/authentication/screens/login/widgets/login_hearder.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(
          padding: ECSpacingStyle.paddingWithAppBarHeight,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Column(
              children: [
                //Logo , title and subtitle
                const LoginHeader(),

                //Form
                const LoginForm(),

                //Divider
                const ECFormDivider(dividerText: ECText.orsignupwith),

                SizedBox(height: ECSize.spaceBtwItems),

                //Footer
                const LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
