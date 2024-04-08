import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/size.dart';

class ECCategories extends StatelessWidget {
  const ECCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (_, index) {
            return Padding(
              padding:
              const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(ECSize.sm),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(100)),
                    child: const Icon(
                      Iconsax.shop,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text('Harsh',
                      style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            );
          }),
    );
  }
}
