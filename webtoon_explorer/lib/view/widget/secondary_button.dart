import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final Widget? child;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final bool? disableBorder;

  const SecondaryButton({
    super.key,
    this.text,
    this.style,
    this.color,
    this.child,
    this.onTap,
    this.height,
    this.width,
    this.padding,
    this.disableBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: (disableBorder ?? false) == false
          ? BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: color ?? AppColors.placeholderColor,
              ),
            )
          : null,
      child: TextButton(
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
        ),
        onPressed: onTap,
        child: child ??
            Text(
              text!,
              style: style ??
                  AppTypography.heading2.copyWith(
                    color: AppColors.placeholderColor,
                  ),
            ),
      ),
    );
  }
}
