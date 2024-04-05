import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/Widgets/profile_tile.dart';
import 'package:e_comm_app/features/personalization/controllers/user_controller.dart';
import 'package:e_comm_app/features/shop/controllers/update_profile_controller.dart';
import 'package:e_comm_app/navigation_bar.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final updateController = Get.put(UpdateProfileController());
    return Scaffold(
      appBar: ECAppBar(
        showBackArrow: true,
        leadingOnPressed: () => Get.off(() => const NavigationMenu()),
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: updateController.updateUserDetailesKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 35,
                      child: Image.asset(ECImageString.faceBookLogo),
                    ),
                  ),
                ),
                SizedBox(height: ECSize.spaceBtwSections),
                const Divider(color: Colors.grey),
                const SizedBox(height: ECSize.md),
                Text('Account Settings',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: ECSize.md),
                ProfileTile(
                  validator: (value) => ECValidator.validateEmptytext('First Name', value),
                  controller: updateController.firstName,
                  leadingText: 'First Name',
                ),
                ProfileTile(
                  validator: (value) => ECValidator.validateEmptytext('Last Name', value),
                  controller: updateController.lastName,
                  leadingText: 'Last Name',
                ),
                ProfileTile(
                  validator: (value) => ECValidator.validateEmptytext('Username', value),
                  controller: updateController.username,
                  leadingText: 'Username',
                ),
                ProfileTile(
                  validator: (value) => ECValidator.validateEmail(value),
                  controller: updateController.email,
                  leadingText: 'Email',
                ),
                ProfileTile(
                  validator: (value) => ECValidator.validatenumber(value),
                  controller: updateController.phone,
                  leadingText: 'Phone Number',
                ),
                const SizedBox(height: ECSize.iconSm),
                Center(
                    child: TextButton(
                  onPressed: () {
                   updateController.updateUserData();
                  },
                  child: Text('Submit',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: ECColors.primary)),
                )),
                Center(
                    child: TextButton(
                  onPressed: () {},
                  child: Text('Close Account',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: Colors.red)),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
