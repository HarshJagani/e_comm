import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/Widgets/home_cart_icon.dart';
import 'package:e_comm_app/features/personalization/controllers/user_controller.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ECAppBar(
      title: Column(
        children: [
          Text(ECText.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.white.withOpacity(0.9))),
          Obx(
            () => Text(controller.user.value.name??'',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white)),
          )
        ],
      ),
      actions: [
        HomeCartIcon(),
      ],
    );
  }
}