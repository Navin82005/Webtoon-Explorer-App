import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final Widget? child;
  final VoidCallback? onTap;
  final double? height;
  final double? width;

  const PrimaryButton({
    super.key,
    this.text,
    this.style,
    this.color,
    this.child,
    this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.primaryForeground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
        ),
        onPressed: onTap,
        child: child ?? Text(text!, style: style ?? AppTypography.heading2),
      ),
    );
  }
}
