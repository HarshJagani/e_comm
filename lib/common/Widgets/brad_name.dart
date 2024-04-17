import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ECBrandName extends StatelessWidget {
  const ECBrandName({super.key, required this.brandName});

  final String brandName;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: 
          Text(
            brandName,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ), ),
          const SizedBox(width: 3),
          const Icon(Iconsax.verify5, size: ECSize.iconSm, color: Colors.blue)
       
      
    ]);
  }
}
