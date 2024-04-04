import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/Widgets/profile_tile.dart';
import 'package:e_comm_app/navigation_bar.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ECAppBar(
        showBackArrow: true,
        leadingOnPressed: () => Get.off(()=>const NavigationMenu()),
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  leadingText: 'Name',
                  icon: Icons.navigate_next,
                  title: 'Harsh Jagani',
                  ontap: () {}),
              ProfileTile(
                  leadingText: 'Username',
                  icon: Icons.navigate_next,
                  title: 'harshjagani',
                  ontap: () {}),
              const Divider(color: Colors.grey),
              const SizedBox(height: ECSize.md),
              Text('Profile Setting',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: ECSize.md),
              ProfileTile(
                  leadingText: 'User Id',
                  icon: Icons.navigate_next,
                  title: '45689',
                  ontap: () {}),
              ProfileTile(
                  leadingText: 'Email',
                  icon: Icons.navigate_next,
                  title: 'harshjagani@gmail.com',
                  ontap: () {}),
              ProfileTile(
                  leadingText: 'Phone Number',
                  icon: Icons.navigate_next,
                  title: '97373000001',
                  ontap: () {}),
              ProfileTile(
                  leadingText: 'Date of Birth',
                  icon: Icons.navigate_next,
                  title: '10 Oct,1994',
                  ontap: () {}),
              const Divider(color: Colors.grey),
              const SizedBox(height: ECSize.iconLg),
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
