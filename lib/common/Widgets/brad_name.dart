import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ECBrandName extends StatelessWidget {
  const ECBrandName({super.key, required this.brandName});

  final String brandName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(brandName,style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: 5),
        const Icon(Iconsax.verify5,size: ECSize.iconSm,color: Colors.blue)
      ]
    );
  }
}
