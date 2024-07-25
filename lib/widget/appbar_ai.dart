import 'package:flutter/material.dart';
import 'package:mindbox/widget/filter_widget.dart';

import '../assest/renk/color.dart';

class CustomAppBarAiWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final onFiltersSelected;

  const CustomAppBarAiWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onFiltersSelected,
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
          actions: [
            IconButton(
            icon: Icon(Icons.filter_list),
            iconSize: 30,
            color: AppColors.accentColor,
            onPressed: () async {
              final selectedFilters = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
              onFiltersSelected(selectedFilters as List<String>?);
            },
          ),
          ]
    );
  }

  @override
  Size get preferredSize =>   const Size.fromHeight(kToolbarHeight);
}
