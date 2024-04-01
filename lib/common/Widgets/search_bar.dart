import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({
    super.key,
    this.hintText = 'Search  for products...'
  });
final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: ECSize.defaultSpace),
          prefixIcon: const Icon(Iconsax.search_normal),
          hintText: hintText,
          hintStyle:
              Theme.of(context).textTheme.bodySmall!.apply(color: Colors.grey),
          fillColor: Colors.white,
          filled: true),
    );
  }
}
