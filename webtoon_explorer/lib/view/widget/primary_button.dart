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
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const PrimaryButton({
    super.key,
    this.text,
    this.style,
    this.color,
    this.child,
    this.onTap,
    this.height,
    this.width,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8),
          child: child ?? Text(text!, style: style ?? AppTypography.heading2),
        ),
      ),
    );
  }
}
