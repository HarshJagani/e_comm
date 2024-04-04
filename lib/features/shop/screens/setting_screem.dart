import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/Widgets/settingmenu_tile.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFF000555), Color(0xFF004e92)],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          Column(
            children: [
              ECAppBar(
                title: Text('Account',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Image.asset(ECImageString.faceBookLogo),
                ),
                title: Text('Harsh Jagani',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: Colors.white)),
                subtitle: Text('harshjagani@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: Colors.white.withOpacity(0.9))),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Iconsax.edit)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160, right: 20, left: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account Settings',
                      style: Theme.of(context).textTheme.headlineSmall),
                  SettingMenuTile(
                      ontap: () {},
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set delivery address'),
                  SettingMenuTile(
                      ontap: () {},
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout'),
                  SettingMenuTile(
                      ontap: () {},
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and completed orders'),
                  SettingMenuTile(
                      ontap: () {},
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'See all available discount coupons'),
                  SettingMenuTile(
                      ontap: () {},
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'withdraw balance to registerd bank account'),
                  SettingMenuTile(
                      ontap: () {},
                      icon: Iconsax.notification,
                      title: 'notifications',
                      subTitle: 'View all notifications'),
                  SettingMenuTile(
                      ontap: () {},
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data and connected accounts'),
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
    );
  }
}
