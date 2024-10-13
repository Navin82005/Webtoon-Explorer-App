import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  const PrimaryContainer({
    super.key,
    required this.child,
    this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.primaryForeground,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: child,
        ),
      ),
    );
  }
}
