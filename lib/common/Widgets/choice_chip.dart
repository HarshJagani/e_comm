import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ECChoiceChip extends StatelessWidget {
  ECChoiceChip(
      {super.key,
      required this.label,
      this.onSelected,
      required this.selected});
  RxBool selected;
  final String label;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChoiceChip(
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(label, style: Theme.of(context).textTheme.titleLarge),
        ),
        selected: selected.value,
        onSelected: (value) {
          selected.value = !selected.value;
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        labelPadding: const EdgeInsets.all(0),
        showCheckmark: false,
      ),
    );
  }
}
