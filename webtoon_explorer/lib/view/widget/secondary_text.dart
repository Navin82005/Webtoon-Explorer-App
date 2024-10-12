import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';

class SecondaryText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final TextStyle? style;
  final Color? textColor;
  final EdgeInsets? padding;

  const SecondaryText({
    super.key,
    required this.text,
    this.onTap,
    this.style,
    this.textColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(text, style: style ?? AppTypography.subHeading1),
        ),
      ),
    );
  }
}
