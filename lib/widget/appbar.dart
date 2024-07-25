import 'package:flutter/material.dart';

import '../assest/renk/color.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const CustomAppBarWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.merge(
          const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
            color: AppColors.backgroundColor, // Renk değeriniz burada
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>   const Size.fromHeight(kToolbarHeight);

}
