import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/features/authentication/models/usermodel.dart';
import 'package:e_comm_app/features/shop/controllers/update_profile_controller.dart';
import 'package:e_comm_app/navigation_bar.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/validators/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {

  //Initialization and variables.
  ProfileScreen({super.key});
  final updateController = Get.put(UpdateProfileController());
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(builder: (controller) {
      return Scaffold(
        appBar: ECAppBar(
          showBackArrow: true,
          leadingOnPressed: () => Get.off(() => const NavigationMenu()),
          title: Text('Profile',
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: buildBody(context),
      );
    });
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              TextFormField(
                controller: updateController.firstName,
                validator: (value) =>
                    ECValidator.validateEmptytext('First Name', value),
                decoration: const InputDecoration(
                    labelText: 'Firstname', hintText: 'Firstname'),
              ),
              const SizedBox(height: ECSize.md),
              TextFormField(
                controller: updateController.lastName,
                validator: (value) =>
                    ECValidator.validateEmptytext('Last Name', value),
                decoration: const InputDecoration(
                    labelText: 'Lastname', hintText: 'Lastname'),
              ),
              const SizedBox(height: ECSize.md),
              TextFormField(
                controller: updateController.userName,
                validator: (value) =>
                    ECValidator.validateEmptytext('User Name', value),
                decoration: const InputDecoration(
                    labelText: 'Userrname', hintText: 'Username'),
              ),
              const SizedBox(height: ECSize.md),
              TextFormField(
                controller: updateController.email,
                validator: (value) => ECValidator.validateEmail(value),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'Email', hintText: 'Email'),
              ),
              const SizedBox(height: ECSize.md),
              TextFormField(
                controller: updateController.phone,
                validator: (value) => ECValidator.validatenumber(value),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: 'phone',
                ),
              ),
              const SizedBox(height: ECSize.iconSm),
              Center(
                  child: TextButton(
                onPressed: () {
                  final userNewData = UserModel(
                      id: auth.currentUser?.uid,
                      emailAddress: updateController.email.text,
                      firstName: updateController.firstName.text,
                      lastName: updateController.lastName.text,
                      userName: updateController.userName.text,
                      phoneNumber: updateController.phone.text,
                      profilePicture: '');
                  updateController.updateUserData(userNewData);
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
    );
  }
}
