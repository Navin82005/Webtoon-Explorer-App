import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';

class SecondaryContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const SecondaryContainer({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.secondaryBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: child,
        ),
      ),
    );
  }
}
