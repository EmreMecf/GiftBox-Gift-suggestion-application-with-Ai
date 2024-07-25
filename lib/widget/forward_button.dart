import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mindbox/assest/renk/color.dart';

class ForwardButton extends StatelessWidget {
  final Function() onTap;

  const ForwardButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Ionicons.chevron_forward_outline),
      ),
    );
  }
}
