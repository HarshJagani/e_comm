import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/Widgets/settingmenu_tile.dart';
import 'package:e_comm_app/features/personalization/controllers/user_controller.dart';
import 'package:e_comm_app/features/shop/screens/profile_settings.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xFF000555), Color(0xFF004e92)],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                children: [
                  ECAppBar(
                    title: Text('Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: Colors.white)),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(ECImageString.faceBookLogo),
                    ),
                    title: Text(controller.user.value.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white)),
                    subtitle: Text(controller.user.value.emailAddress,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: Colors.white.withOpacity(0.9))),
                    trailing: IconButton(
                        onPressed: () {
                          Get.off(() => const ProfileScreen());
                        },
                        icon: const Icon(Iconsax.edit, color: Colors.white)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(ECSize.defaultSpace),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account Settings',
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 10),
                    SettingMenuTile(
                        ontap: () {},
                        icon: Iconsax.safe_home,
                        title: 'My Addresses',
                        subTitle: 'Set delivery address'),
                    const SizedBox(height: 10),
                    SettingMenuTile(
                        ontap: () {},
                        icon: Iconsax.shopping_cart,
                        title: 'My Cart',
                        subTitle: 'Add, remove products and move to checkout'),
                    const SizedBox(height: 10),
                    SettingMenuTile(
                        ontap: () {},
                        icon: Iconsax.bag_tick,
                        title: 'My Orders',
                        subTitle: 'In-progress and completed orders'),
                    const SizedBox(height: 10),
                    SettingMenuTile(
                        ontap: () {},
                        icon: Iconsax.discount_shape,
                        title: 'My Coupons',
                        subTitle: 'See all available discount coupons'),
                    const SizedBox(height: 10),
                    SettingMenuTile(
                        ontap: () {},
                        icon: Iconsax.bank,
                        title: 'Bank Account',
                        subTitle: 'withdraw balance to registerd bank account'),
                    const SizedBox(height: 10),
                    SettingMenuTile(
                        ontap: () {},
                        icon: Iconsax.notification,
                        title: 'notifications',
                        subTitle: 'View all notifications'),
                    const SizedBox(height: 10),
                    SettingMenuTile(
                        ontap: () {},
                        icon: Iconsax.security_card,
                        title: 'Account Privacy',
                        subTitle: 'Manage data and connected accounts'),
                    const SizedBox(height: 10),
                    const SizedBox(height: 7),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {}, child: const Text('Logout')))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
