import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;
  final List<Widget>? actions;
  const ToolBar({super.key, required this.appBarName, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 1,
      centerTitle: false,
      title: Text(
        appBarName,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
