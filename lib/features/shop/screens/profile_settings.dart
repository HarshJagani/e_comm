import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ECAppBar(
        showBackArrow: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add)
          ),
        ],
      ),
    );
  }
}