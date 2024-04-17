import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ECProductBottomNav extends StatelessWidget {
  const ECProductBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt quantity = 0.obs;

    int addQuntity() {
      quantity += 1;
      return quantity.value;
    }

    int removeQuntity() {
      if (quantity > 0) {
        quantity -= 1;
      }
      return quantity.value;
    }

    return Obx(
      () => Container(
        height: 70,
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ECColors.textWhite,
                  ),
                  child: InkWell(onTap: () => removeQuntity(),child: const Icon(Iconsax.minus4, color: Colors.black))),
              const SizedBox(width: ECSize.sm),
              Text('$quantity',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: Colors.white)),
              const SizedBox(width: ECSize.sm),
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ECColors.textWhite,
                  ),
                  child: InkWell(onTap: () => addQuntity(),child: const Icon(Iconsax.add, color: Colors.black))),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child:  Text('ADD TO BAG',style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }
}
